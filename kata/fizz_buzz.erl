-module(fizz_buzz).
-export([print_up_to/1]).
-export([numbers_up_to/1]).
-export([convert_value/1]).
-include_lib("eunit/include/eunit.hrl").


returns_value_test() ->
  ?assertEqual("1", convert_value(1)),
  ?assertEqual("2", convert_value(2)).

returns_fizz_test() ->
  ?assertEqual("Fizz", convert_value(3)),
  ?assertEqual("Fizz", convert_value(6)).

returns_buzz_test() ->
  ?assertEqual("Buzz", convert_value(5)),
  ?assertEqual("Buzz", convert_value(10)).

returns_fizz_buzz_test() ->
  ?assertEqual("FizzBuzz", convert_value(15)),
  ?assertEqual("FizzBuzz", convert_value(30)).


returns_correct_output_test() ->
  ?assertEqual("1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
", numbers_up_to(20)).

print_up_to(N) ->
  io:format(numbers_up_to(N)).

numbers_up_to(N) ->
  lists:foldl(fun(X, Sum) -> Sum ++ convert_value(X) ++ "\n" end, "", lists:seq(1, N)).

convert_value(N) ->
  if
    N rem 15 == 0 -> "FizzBuzz";
    N rem 3 == 0 -> "Fizz";
    N rem 5 == 0 -> "Buzz";
    true -> integer_to_list(N)
  end.
