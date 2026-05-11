% ---------- Graph ----------

edge(a,b,2).
edge(a,c,4).
edge(b,c,1).
edge(b,d,7).
edge(c,d,3).
edge(d,e,1).

% ---------- Dijkstra Algorithm ----------

dijkstra(Start, Goal) :-
    shortest(Start, Goal, [Start], 0).

% goal reached
shortest(Goal, Goal, _, Cost) :-
    nl,
    write('Shortest Cost = '),
    write(Cost).

% choose minimum edge
shortest(Current, Goal, Visited, Cost) :-

    findall([C,Next],
           (edge(Current,Next,C),
           not(member(Next,Visited))),
           List),

    sort(List, Sorted),

    Sorted = [[Min,Next]|_],

    write(Current),
    write(' -> '),
    write(Next), nl,

    NewCost is Cost + Min,

    shortest(Next, Goal, [Next|Visited], NewCost).
