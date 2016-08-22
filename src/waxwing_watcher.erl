-module(waxwing_watcher).

-behaviour(gen_server).

% Callback functions which should be exported
-export([init/1]).
-export([handle_cast/2]).

-export([start_link/0]).


start_link() ->
     gen_server:start_link(?MODULE, [], []).

init(_Args) ->
     io:format("ch1 has started (~w)~n", [self()]),
     % If the initialization is successful, the function
     % should return {ok,State}, {ok,State,Timeout} ..
     {ok, state}.

handle_cast(calc, State) ->
     io:format("result 2+2=4~n"),
     {noreply, State};
handle_cast(calcbad, State) ->
     io:format("result 1/0~n"),
     1 / 0,
     {noreply, State}.
