% ---------- Graph with Cost ----------

edge(a,b,2).
edge(a,c,3).
edge(b,d,4).
edge(b,e,5).
edge(c,f,6).
edge(e,g,2).
edge(f,g,1).

% ---------- Heuristic Values ----------

h(a,7).
h(b,6).
h(c,4).
h(d,5).
h(e,2).
h(f,1).
h(g,0).

% ---------- A* Algorithm ----------

astar(Start, Goal) :-
    search([[Start,0]], Goal).

% Goal reached
search([[Goal,Cost]|_], Goal) :-
    write('Goal Reached: '), write(Goal), nl,
    write('Cost = '), write(Cost).

% Expand node
search([[Node,Cost]|Rest], Goal) :-
    findall([Next,NewCost],
           (edge(Node,Next,C),
            NewCost is Cost + C),
           Children),

    append(Rest, Children, NewQueue),

    sort_queue(NewQueue, Sorted),

    search(Sorted, Goal).

% ---------- Sorting using Heuristic ----------

sort_queue(Queue, Sorted) :-
    predsort(compare_nodes, Queue, Sorted).

compare_nodes(<,[A,Cost1],[B,Cost2]) :-
    h(A,H1),
    h(B,H2),
    F1 is Cost1 + H1,
    F2 is Cost2 + H2,
    F1 < F2.

compare_nodes(>,[A,Cost1],[B,Cost2]) :-
    h(A,H1),
    h(B,H2),
    F1 is Cost1 + H1,
    F2 is Cost2 + H2,
    F1 >= F2.