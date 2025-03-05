map(_, [], []).

map(Pred, [X|Xs], [Y|Ys]) :-
    call(Pred, X, Y),
    map(Pred, Xs, Ys).

fmap(_Pred, X, X) :-
    var(X), !.

fmap(Pred, X, Y) :-
    atomic(X), !,
    call(Pred, X, Y).

fmap(Pred, [H|T], [H2|T2]) :- !,
    fmap(Pred, H, H2),
    fmap(Pred, T, T2).

fmap(Pred, Term, Result) :-
    compound(Term),
    call(Pred, Term, Transformed),
    ( Term == Transformed ->
         Term =.. [F|Args],
         map(fmap(Pred), Args, NewArgs),
         Result =.. [F|NewArgs]
    ;
         Result = Transformed
    ).

add4(X, Y) :-  
    number(X),
    Y is X + 4.
add4(X, X).

move3(point(X, Y), point(X3, Y3)) :-
    X3 is X + 3,
    Y3 is Y + 3.
move3(X, X).
