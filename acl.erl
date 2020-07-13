%%%-------------------------------------------------------------------
%%% @author lt
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 7月 2020 14:43
%%%-------------------------------------------------------------------
-module(acl).
-author("lt").

%% API
-export([
  check_acl/1
]).




check_acl( ClientInfo ) ->
  ClientID = maps:get("clientID", ClientInfo, null),
  Result = check_if(ClientID),
  if
    Result /= nomatch ->
      ClientID;
    true ->
      io:format("clientID is error: ~w~n", [ClientID])
  end.



check_if(ClientID) ->
  {ok,A} = re:compile("^device/(.*)",[caseless]),
  re:run(ClientID,A,[{capture,[0],list}]).


%%  if
%%    ClientID == "device/sn" ->
%%      io:format(ClientID);
%%    true ->
%%      io:format("clientID is error: ~w~n", [ClientID])
%%  end.






