% ---------- Graph Coloring Problem ----------

:- dynamic colored/2.

% graph edges
edge(a,b).
edge(a,c).
edge(b,c).
edge(b,d).
edge(c,d).

% available colors
color(red).
color(green).
color(blue).

% ---------- Main Program ----------

graph_coloring :-
    retractall(colored(_,_)),
    assign(a),
    assign(b),
    assign(c),
    assign(d).

% assign colors
assign(Node) :-

    color(Color),

    safe(Node, Color),

    write(Node),
    write(' -> '),
    write(Color), nl,

    assert(colored(Node, Color)).

% check safe coloring
safe(Node, Color) :-

    not(
        (
            (edge(Node, Next); edge(Next, Node)),
            colored(Next, Color)
        )
    ).
