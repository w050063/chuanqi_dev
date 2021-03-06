%%%-------------------------------------------------------------------
%%% @author apple
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 十一月 2015 14:11
%%%-------------------------------------------------------------------
-module(lottery_box_log_db).

-include("common.hrl").
-include("cache.hrl").

%% API
-export([
	select_row/1,
	insert/1,
	select_all/1,
	update/2,
	select_by_type/1,
	select_by_player/2
]).

%% ====================================================================
%% API functions
%% ====================================================================

select_row(Id) ->
	case db:select_row(lottery_box_log, record_info(fields, db_lottery_box_log), [{id, Id}]) of
		[] ->
			null;
		List ->
			list_to_tuple([db_lottery_box_log | List])
	end.

select_all(GroupNum) ->
	Sql = lists:concat([" select * from lottery_box_log where group_num=", GroupNum, " order by id desc limit 20"]),
	List = db:select_all(Sql),
	[list_to_tuple([db_lottery_box_log | X]) || X <- List].

select_by_type(LotteryType) ->
	Sql = lists:concat([" select * from lottery_box_log where lottery_type=", LotteryType, " order by id desc limit 20"]),
	List = db:select_all(Sql),
	[list_to_tuple([db_lottery_box_log | X]) || X <- List].

select_by_player(LotteryType, PlayerId) ->
	Sql = lists:concat([" select * from lottery_box_log where lottery_type=", LotteryType," and player_id=", PlayerId, " order by id desc limit 20"]),
	List = db:select_all(Sql),
	[list_to_tuple([db_lottery_box_log | X]) || X <- List].

update(Id, LotteryLogInfo) ->
	db:update(lottery_box_log, util_tuple:to_tuple_list(LotteryLogInfo), [{id, Id}]).

insert(LotteryLogInfo) ->
	db:insert(lottery_box_log, util_tuple:to_tuple_list(LotteryLogInfo)).

