-module(lab7).
-export([sum1/3, sum2/3]).

sum1(Acc, CurrK, MaxK) when CurrK == MaxK ->
	io:write(Acc), io:fwrite("\n");
sum1(Acc, CurrK, MaxK) ->
	receive
		Element -> sum1(Element+Acc, CurrK+1, MaxK)
	end.

g(A,K,X, Post) -> 
	spawn(fun () ->
		Post ! A(K) * math:pow(X,K)
	end).

sum2(A, K, X) ->
	Post = spawn(?MODULE, sum1, [0,0,K]),
	[g(A,K1,X,Post) || K1 <- lists:seq(1,K)]
	,io:fwrite("").