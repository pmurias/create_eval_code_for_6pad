use nqp;
use MONKEY-SEE-NO-EVAL;

my $register := EVAL(:lang<JavaScript>, 'return (function(cb) {
    window.evalP6 = function(code) {
        cb(code);
    }
    return 1;
})');

$register(-> str $code {
    for GLOBAL.WHO.keys -> $key {
        GLOBAL.WHO{$key}:delete;
    }
    EVAL($code);
    CATCH {
        default {
            say($_.gist);
        }
    }
});
