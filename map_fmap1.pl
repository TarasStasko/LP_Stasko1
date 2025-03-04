% map(+Pred, +InputList, -OutputList)
map(_, [], []).

map(Pred, [X|Xs], [Y|Ys]) :-
    call(Pred, X, Y),
    map(Pred, Xs, Ys).

% maybe_fmap(+Pred, +MaybeValue, -Result)
maybe_fmap(_, nothing, nothing).

maybe_fmap(Pred, just(X), just(Y)) :-
    call(Pred, X, Y).

add1(X, Y) :- Y is X + 1.