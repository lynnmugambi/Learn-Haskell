
man(john).
man(fred).
man(harry).

woman(mary).
woman(julie).
woman(susan).
woman(anne).

blonde(john).
blonde(julie).
blonde(susan).
dark(fred).
dark(harry).
brunette(anne).
brunette(mary).


owns_gold(fred).
owns_gold(julie).
rich(X):-owns_gold(X).

%OR

rich1(fred).
rich1(julie).

like(john,X):- (rich(X);blonde(X)),woman(X).
like(harry,X):- rich(X),woman(X).
like(fred,X):- brunette(X),woman(X).
like(mary,X):- dark(X),man(X).
like(julie,X):-dark(X),rich(X),man(X).
like(susan,X):-man(X).
like(anne,X):-man(X).







