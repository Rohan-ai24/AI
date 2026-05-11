% ---------- Graph Definition ----------
% Undirected graph edges

edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(e,f).

% ---------- DFS Algorithm ----------

% Move between connected nodes (both directions)
connected(X,Y) :- edge(X,Y).
connected(X,Y) :- edge(Y,X).

% DFS traversal
dfs(Start) :-
    travel(Start, []).

% If node already visited
travel(Node, Visited) :-
    member(Node, Visited),
    !.

% Visit node and continue DFS
travel(Node, Visited) :-
    write(Node), nl,
    connected(Node, Next),
    travel(Next, [Node|Visited]).

travel(_, _).