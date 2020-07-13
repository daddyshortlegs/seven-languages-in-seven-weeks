-module(bowling).
-include_lib("eunit/include/eunit.hrl").

gutter_ball_test() ->
  ?assertEqual(0, score_rolls([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).

all_ones_test() ->
  ?assertEqual(20, score_rolls([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])).

spare_test() ->
  ?assertEqual(20, score_rolls([2, 8, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).



score_rolls([]) -> 0;

score_rolls([Current | Rolls]) ->
  [Next | _] = if
                 Rolls == [] -> [0, 0];
                 true -> Rolls
                 end,
  io:format("Current roll = ~p, Next roll = ~p~n", [Current, Next]),
  if
    Current + Next == 10 ->
      NextScore = lists:nth(2, Rolls),
      io:format("Spare, next score = ~p~n", [NextScore]),
      10 + NextScore + score_rolls(lists:nthtail(1, Rolls));
    true -> Current + score_rolls(Rolls)
  end.




