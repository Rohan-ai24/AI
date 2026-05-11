% ---------- Undirected Graph ----------

edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(e,f).

% connection in both directions
connected(X,Y) :- edge(X,Y).
connected(X,Y) :- edge(Y,X).

% ---------- Breadth First Search ----------

bfs(Start) :-
    traverse([Start], []).

% if queue is empty
traverse([], _).

% if node already visited
traverse([Node|Queue], Visited) :-
    member(Node, Visited),
    traverse(Queue, Visited).

% visit node and continue BFS
traverse([Node|Queue], Visited) :-
    write(Node), nl,
    findall(X,
            (connected(Node,X),
            not(member(X,Visited)),
            not(member(X,Queue))),
            Children),
    append(Queue, Children, NewQueue),
    traverse(NewQueue, [Node|Visited]).