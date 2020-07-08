-module(translate_doctor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(translator, spawn_link(fun translate:loop/0)),
      loop();

    {'EXIT', From, Reason} ->
      io:format("The process ~p died for some reason ~p.", [From, Reason]),
      io:format(" Restarting.~n"),
      self() ! new,
      loop()
  end.
