-module(lab6).
-export([sum1/3, fact/1]).

sum1(A, K, X) ->
	sum1(A, K, X, 0).

sum1(_,0,_,Sum) -> Sum;
sum1(A, K, X, Sum) ->
	sum1(A, K-1, X, Sum + A(K) * math:pow(X, K)).
