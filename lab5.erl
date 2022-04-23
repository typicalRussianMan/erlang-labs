-module(lab5).
-export([del/2, max1/1, clearList/2]).

%удаляет все элементы А из Х (Х - многоуровневый)
del(A, X) -> 
	del(A, X, []).
del(_, [], Acc) -> lists:reverse(Acc);
del(A, [Hd | Rst], Acc) when is_list(Hd) ->
	del(A, Rst, [del(A, Hd, []) | Acc]);
del(A, [Hd | Rst], Acc) when A == Hd ->
	del(A, Rst, Acc);
del(A, [Hd | Rst], Acc) ->
	del(A, Rst, [Hd | Acc]).
