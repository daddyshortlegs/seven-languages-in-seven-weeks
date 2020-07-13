-module(leap_year).
-export([is_leap_year/1]).
-include_lib("eunit/include/eunit.hrl").

not_leap_year_when_not_divisible_by_4_test() ->
  ?assertEqual(false, is_leap_year(1997)).

is_leap_year_when_divisible_by_4_test() ->
  ?assertEqual(true, is_leap_year(1996)).

is_leap_year_when_divisible_by_400_test() ->
  ?assertEqual(true, is_leap_year(1600)).

not_leap_year_when_divisible_by_4_and_100_but_not_400_test() ->
  ?assertEqual(false, is_leap_year(1800)).

is_leap_year(Year) ->
    (Year rem 4 == 0) and not ((Year rem 100 == 0) and (Year rem 400 /= 0)).
