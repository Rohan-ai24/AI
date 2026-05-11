% ---------- N Queen Problem ----------

nqueen(N) :-
    queens(N, N, [], Solution),
    write('Solution = '),
    write(Solution).

% all queens placed
queens(0, _, Solution, Solution).

queens(Row, N, Temp, Solution) :-

    Row > 0,

    between(1, N, Col),

    safe(Row, Col, Temp),

    Row1 is Row - 1,

    queens(Row1, N, [Col|Temp], Solution).

% ---------- Safety Check ----------

safe(_, _, []).

safe(Row, Col, [C|Rest]) :-

    Col =\= C,

    abs(Col - C) =\= Row,

    Row1 is Row - 1,

    safe(Row1, Col, Rest).