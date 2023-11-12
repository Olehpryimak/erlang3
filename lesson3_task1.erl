-module(lesson3_task1).
-export([first_word/1]).

first_word(S) -> first_word(trim(S), <<>>).

first_word(<<>>, Res) -> Res;
first_word(<<" ", _/binary >>, Res) -> Res;
first_word(<<Char/utf8, Rest/binary>>, Res) -> first_word(Rest, <<Res/binary, Char/utf8>>).

trim(<<" ", Rest/binary>>) -> trim(Rest);
trim(A) -> A.
