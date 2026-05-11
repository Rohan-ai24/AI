% ---------- Job(Name, Profit, Deadline) ----------

job(j1,100,2).
job(j2,50,1).
job(j3,150,2).
job(j4,200,1).

% ---------- Job Scheduling ----------

schedule_jobs :-

    findall([Profit,Name,Deadline],
           job(Name,Profit,Deadline),
           Jobs),

    sort(Jobs, Sorted),
    reverse(Sorted, Descending),

    write('Selected Jobs : '), nl,

    select_jobs(Descending, [], 0).

% if no jobs left
select_jobs([], _, TotalProfit) :-
    nl,
    write('Total Profit = '),
    write(TotalProfit).

% select job greedily
select_jobs([[Profit,Name,Deadline]|Rest], Slots, TotalProfit) :-

    not(member(Deadline, Slots)),

    write(Name),
    write(' Profit = '),
    write(Profit),
    write(' Deadline = '),
    write(Deadline), nl,

    NewProfit is TotalProfit + Profit,

    select_jobs(Rest, [Deadline|Slots], NewProfit).

% skip job if slot already filled
select_jobs([_|Rest], Slots, TotalProfit) :-
    select_jobs(Rest, Slots, TotalProfit).