%%% -------------------------------------------------------------------
%%% Author  : ming
%%% Description :
%%%
%%% Created : 2012-6-5
%%% -------------------------------------------------------------------
-module(tcp_client_sup).

-behaviour(supervisor).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("common.hrl").

%% --------------------------------------------------------------------
%% External exports
%% --------------------------------------------------------------------
-export([start_link/0]).

%% --------------------------------------------------------------------
%% Internal exports
%% --------------------------------------------------------------------
-export([
	init/1
]).

%% --------------------------------------------------------------------
%% Macros
%% --------------------------------------------------------------------
-define(SERVER, ?MODULE).

%% --------------------------------------------------------------------
%% Records
%% --------------------------------------------------------------------

%% ====================================================================
%% External functions
%% ====================================================================

%%
%% TODO: Add description of start_link/function_arity
%%
start_link() ->
	supervisor:start_link({local, ?SERVER}, ?SERVER, []).


%% ====================================================================
%% Server functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Func: init/1
%% Returns: {ok,  {SupFlags,  [ChildSpec]}} |
%%          ignore                          |
%%          {error, Reason}
%% --------------------------------------------------------------------
init([]) ->
	AChild = {tcp_client, {tcp_client, start_link, []},
		temporary, brutal_kill, worker, [tcp_client]},
	{ok, {{simple_one_for_one, 10, 10}, [AChild]}}.

%% ====================================================================
%% Internal functions
%% ====================================================================

