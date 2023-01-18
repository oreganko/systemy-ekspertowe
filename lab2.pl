    
:-dynamic s/2.

s(0, 1).

count_s(N, X):- s(N, X).

count_s(N, X):-
    N1 is N - 1,
    count_s(N1, X1),
    X is N * X1,
    assert(s(N, X)).
    
    
    
    
not(P) :- P, !, fail; true.

max(X, Y, Res) :- X > Y, Res is X, !; X < Y, Res is Y.

max(A, B, B):- -A < B, !.
max(A, _, A).
