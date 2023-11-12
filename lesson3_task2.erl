-module(lesson3_task2).
-export([words/1]).

words(S) -> clear(words(S, <<>>, [])).

words(<<>>, Cur, Res) -> [Cur|Res];
words(<<" ", Rest/binary >>, Cur, Res) -> words(Rest, <<>>, [Cur|Res]);
words(<<Char/utf8, Rest/binary>>, Cur, Res) -> words(Rest, <<Cur/binary, Char/utf8>>, Res).

clear(L) -> clear(L, []).

clear([], R) -> R;
clear([<<>>|T], R) -> clear(T, R);
clear([H|T], R) -> clear(T, [H|R]).
