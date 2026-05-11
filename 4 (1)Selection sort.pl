% ---------- Selection Sort ----------

selection_sort([], []).

selection_sort(List, [Min|Sorted]) :-

    min_list(List, Min),

    remove(Min, List, Rest),

    selection_sort(Rest, Sorted).

% ---------- Remove Element ----------

remove(X, [X|T], T).

remove(X, [H|T], [H|R]) :-
    remove(X, T, R).