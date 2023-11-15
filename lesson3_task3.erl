-module(lesson3_task3).
-export([split/2, convert/1, removeStart/2, startsWith/2]).

split(S, Del) -> clear(split(S, <<>>, [], convert(Del))).

split(<<>>, Cur, Res, _) -> [Cur|Res];
split(<<A/utf8, Rest/binary>>, Cur, Res, Del) -> 
	case startsWith(<<A/utf8, Rest/binary>>, Del) of
		true -> split(removeStart(<<A/utf8, Rest/binary>>, byte_size(Del)), <<>>, [Cur|Res], Del);
		false -> split(Rest, <<Cur/binary, A/utf8>>, Res, Del)
	end.

startsWith(<<Char/utf8, Rest/binary>>, <<Char/utf8, Rest2/binary>>) -> startsWith(Rest, Rest2);
startsWith(_, <<>>) -> true;
startsWith(_, _) -> false.

removeStart(A, 0) -> A;
removeStart(<<_, Rest/binary>>, N) -> removeStart(Rest, N-1).

clear(L) -> clear(L, []).

clear([], R) -> R;
clear([<<>>|T], R) -> clear(T, R);
clear([H|T], R) -> clear(T, [H|R]).

convert(S) -> convert(S, <<>>).

convert([], R) -> R;
convert([H|T], R) -> convert(T, <<R/binary, H/utf8>>).
