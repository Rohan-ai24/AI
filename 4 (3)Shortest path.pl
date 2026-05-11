% ---------- Graph with Cost ----------

edge(a,b,2).
edge(a,c,4).
edge(b,c,1).
edge(b,d,7).
edge(c,d,3).
edge(d,e,1).

% ---------- Shortest Path ----------

shortest_path(Start, Goal, Cost) :-
    path(Start, Goal, [Start], Cost).

% goal reached
path(Node, Node, _, 0).

path(Start, Goal, Visited, Cost) :-

    edge(Start, Next, C),

    not(member(Next, Visited)),

    path(Next, Goal, [Next|Visited], Remaining),

    Cost is C + Remaining.