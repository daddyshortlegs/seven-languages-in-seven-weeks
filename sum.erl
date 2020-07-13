-module(sum).
-export([total/1]).

total([]) ->
  0;
total([First | Rest]) ->
  First + total(Rest).

