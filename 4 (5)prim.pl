% ---------- Graph ----------

edge(a,b,1).
edge(a,c,4).
edge(b,c,2).
edge(b,d,5).
edge(c,d,3).

% ---------- Prim's Algorithm ----------

prim :-
    write('Edges in MST :'), nl,
    mst([a], 0).

mst(Visited, Cost) :-

    findall([C,X,Y],
           (edge(X,Y,C),
           member(X,Visited),
           not(member(Y,Visited))),
           List),

    sort(List, Sorted),

    (
        Sorted = [[Min,X,Y]|_]
        ->
        write(X-Y),
        write(' Cost = '),
        write(Min), nl,

        NewCost is Cost + Min,

        mst([Y|Visited], NewCost)

        ;

        nl,
        write('Total Cost = '),
        write(Cost)
    ).
