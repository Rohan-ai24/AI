% ---------- Graph ----------

edge(a,b,1).
edge(a,c,4).
edge(b,c,2).
edge(b,d,5).
edge(c,d,3).

% ---------- Kruskal Algorithm ----------

kruskal :-

    findall([C,X,Y],
           edge(X,Y,C),
           Edges),

    sort(Edges, Sorted),

    write('Edges in MST :'), nl,

    build_mst(Sorted, [], 0).

% if no edges left
build_mst([], _, Cost) :-
    nl,
    write('Total Cost = '),
    write(Cost).

% select edge
build_mst([[C,X,Y]|Rest], Visited, Cost) :-

    not(member(X-Y,Visited)),
    not(member(Y-X,Visited)),

    write(X-Y),
    write(' Cost = '),
    write(C), nl,

    NewCost is Cost + C,

    build_mst(Rest, [X-Y|Visited], NewCost).

% skip edge
build_mst([_|Rest], Visited, Cost) :-
    build_mst(Rest, Visited, Cost).
