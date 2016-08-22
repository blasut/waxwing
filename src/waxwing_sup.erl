%%%-------------------------------------------------------------------
%% @doc waxwing top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(waxwing_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
  RestartStrategy = {simple_one_for_one, 10, 60},
  Children = [{waxwing_watcher, {waxwing_watcher, start_link, []},
              permanent, brutal_kill, worker, [waxwing_watcher]}],
  {ok, {RestartStrategy, Children}}.

%%====================================================================
%% Internal functions
%%====================================================================
