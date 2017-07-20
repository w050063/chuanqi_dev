%% Author: Administrator
%% Created: 2012-6-10
%% Description: TODO: Add description to server_app
-module(server_app).

-behaviour(application).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("common.hrl").
-include("record.hrl").

%% --------------------------------------------------------------------
%% Behavioural exports
%% --------------------------------------------------------------------
-export([
	start/2,
	stop/1
]).

%% --------------------------------------------------------------------
%% Internal exports
%% --------------------------------------------------------------------
-export([]).

%% --------------------------------------------------------------------
%% Macros
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Records
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% API Functions
%% --------------------------------------------------------------------


%% ====================================================================!
%% External functions
%% ====================================================================!
%% --------------------------------------------------------------------
%% Func: start/2
%% Returns: {ok, Pid}        |
%%          {ok, Pid, State} |
%%          {error, Reason}
%% --------------------------------------------------------------------
start(normal, []) ->
	inets:start(),
	ssl:start(),

	%% error_logger:add_report_handler(logger_handle),
	IsTty = config:get_log_tty(),
	error_logger:tty(IsTty),
	LogLevel = config:get_log_level(),
	LogList = config:get_log_list(),
	loglevel:set(util_data:to_integer(LogLevel), LogList),
	%%config:get_tcp_listener_html(), %% 外网开服替换

	{ok, SupPid} = server_sup:start_link(),

	ServerMod = misc:get_node_type(),
	ServerMod:start(),
	{ok, SupPid}.

%% --------------------------------------------------------------------
%% Func: stop/1
%% Returns: any
%% --------------------------------------------------------------------
stop(_State) ->
	ServerMod = misc:get_node_type(),
	ServerMod:stop(),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================