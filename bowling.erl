-module(bowling).
-include_lib("eunit/include/eunit.hrl").

gutter_ball_test() ->
  ?assertEqual(0, score_rolls([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).

all_ones_test() ->
  ?assertEqual(20, score_rolls([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])).

spare_test() ->
  ?assertEqual(20, score_rolls([2, 8, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).

%%strike_test() ->
%%  ?assertEqual(24, score_rolls([10, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])).

%%all_strikes_test() ->
%%  ?assertEqual(300, score_rolls([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])).

score_rolls([]) -> 0;

score_rolls(Rolls) -> score_rolls(Rolls, 0, 0).

score_rolls(Rolls, 10, Score) -> Score;

score_rolls([Current | Rolls], Frame, Score) ->
  io:format("Score = ~p~n", [Score]),
  if
    Frame == 10 -> Score;
    true ->
      [_ | NextFrame] = Rolls,
      [Next | _] = Rolls,
      if
        Current == 10 ->
          [Next, OneAfter | _] = Rolls,
          io:format("Strike, next = ~p, one after ~p~n", [Next, OneAfter]),
          io:format("Rolls = ~p~n", [Rolls]),
          score_rolls(Rolls, Frame + 1, Score + 10 + Next + OneAfter);
        Current + Next == 10 ->
          [Next, OneAfter | _] = Rolls,
          io:format("Spare, next score = ~p~n", [OneAfter]),
          io:format("Next Frame = ~p~n", [NextFrame]),
          score_rolls(NextFrame, Frame + 1, Score + 10 + OneAfter);
        true ->
          io:format("Pin down, current = ~p, next = ~p~n", [Current, Next]),
          score_rolls(NextFrame, Frame + 1, Score + Current + Next)
      end
end.




