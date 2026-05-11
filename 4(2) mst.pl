% ---------- Graph Edges with Cost ----------

edge(a,b,1).
edge(a,c,5).
edge(b,c,4).
edge(b,d,2).
edge(c,d,3).

% ---------- Minimum Spanning Tree ----------

mst :-
    findall([Cost,X,Y], edge(X,Y,Cost), Edges),
    sort(Edges, SortedEdges),
    build_mst(SortedEdges, [], 0).

% if all edges checked
build_mst([], _, Total) :-
    nl,
    write('Total Cost = '),
    write(Total).

% take edge if it does not form cycle
build_mst([[Cost,X,Y]|Rest], Visited, Total) :-
    not(member(X-Y, Visited)),
    not(member(Y-X, Visited)),
    write(X-Y),
    write(' Cost = '),
    write(Cost), nl,

    NewTotal is Total + Cost,

    build_mst(Rest, [X-Y|Visited], NewTotal).

% skip edge
build_mst([_|Rest], Visited, Total) :-
    build_mst(Rest, Visited, Total).