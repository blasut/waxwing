%%%-------------------------------------------------------------------
%% @doc waxwing public API
%% @end
%%%-------------------------------------------------------------------

-module(waxwing_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    waxwing_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================