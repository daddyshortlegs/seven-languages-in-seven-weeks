-module(count).
-export([to_ten/1]).

to_ten(10) -> 10;
to_ten(N)  -> io:format(to_ten(N + 1)).

