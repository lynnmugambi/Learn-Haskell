-- ARMSTRONG NUMBER - RECURSION
--cube of the digits is the number
dig 0 = []
dig n = [(mod n 10)^3] ++ dig (div n 10)
isarm n = sum (dig n) == n

--PYTH THEOREM
pyth n = [(x,y,z)|x<-[1..n],y<-[x..n],z<-[y..n],x^2+y^2==z^2]

-- FIBONACCI - RECURSION
--1+2 = 3+2 = 5...
fib 1 = 0
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

-- FACTORIAL - RECURSION
--5 = 4x3x2x1...
 
fact1 n = product[1..n]
fact 0 = 1
fact n = n*fact(n-1)

-- PRIMENUMBER - LIST COMPREHENSION
isprime x = [y|y<-[1..x],mod x y == 0] ==[1,x]
listprimes x = [y|y<-[1..x],isprime y]

-- DIVISOR - LIST COMPREHENSION
divisor n = [x|x<-[1..n],mod n x == 0]

-- EVEN/ODD - RECURSION / LIST COMPREHENSION
isevenlist x = [y|y<-[1..x],mod y 2 == 0]
iseven 0 = True
iseven 1 = False
iseven n = isodd(n-1)
isodd n = iseven(n-1)

-- ISFOUND - RECURSION
isfound n [] = False
isfound n y = if ((head y) == n) then True else isfound n (tail y)

-- DOT - RECURSION
dotpro x [] = []
dotpro [] x = []
dotpro x y = [head x * head y] ++ dotpro (tail x) (tail y)

-- LENGTH - RECURSION
mylength [] = 0
mylength x = 1 + mylength(tail x)

-- REVERSE A LIST OF NUMBERS - RECURSION
myreverse [] = []
myreverse x = [last x] ++ myreverse(init x)

-- CHECK IF NUMBER EXISTS IN LIST - LIST COMPREHENSION
isexist n ys = [True|x<-ys,n==x]

-- FIND LAST NUMBER IN LIST
findlast [] = []
findlast x = if ((length x) == 1) then (head x) else findlast (tail x)
findlast1 [x] = x
findlast1 (x:xs) = findlast1(xs)

-- Count number of occurences for a number in a list - list comprehension
-- n is the list
countocc n y = sum [1|x<-n,x==y]

-- SUM ALL NUMBERS IN A LIST
sumnumber [] = 0
sumnumber x = (head x) + sumnumber(tail x)
mysum [] = 0
mysum (x:xs) = x + mysum xs

-- CURRIED FUNCTIONS
getfirstelement (x:xs) = x
gettail (x:xs) = xs

-- FIND SMALLEST NUMBER
smallest [x] = x
smallest (x:y:xs) = if (x<y) then smallest(x:xs) else smallest(y:xs)

-- ASCENDING?
asc [] = True
asc (x:xs) | xs==[] = True | x < head xs = asc xs | otherwise = False
			
-- pairing lists
myzip xs [] = []
myzip [] ys = []
myzip (x:xs) (y:ys) = (x,y) : myzip xs ys

myzip1 x y = [(j,k)|j<-x,k<-y]

--MERGE SORT
merge [] (y:ys) = (y:ys)
merge (x:xs) [] = (x:xs)
merge (x:xs) (y:ys) = if x<y then x:merge xs (y:ys) else y:merge (x:xs) ys

msort [] = []
msort [x] = [x]
msort xs = merge (msort(take(div(length xs)2) xs))  (msort(drop(div(length xs) 2) xs))

-- QUICK SORT
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) = quicksort[a|a<-xs, a<=x] ++ [x] ++ quicksort[a|a<-xs, a>x]

--SELECTION SORT
smallist (xs) =[a|a<-xs,a==smallest(xs)]

selsort []=[]
selsort xs= smallist(xs) ++ selsort([a|a<-xs,a/=smallest(xs)])

selection []=[]
selection [x]=[x]
selection (x:xs) = selection[a|a<-xs, a<=x] ++[a|a<-xs,a>x] --dropping head?

--HIGHER ORDER FUNCTION

mymap f xs = [f<x | x<-xs] --condition is optional

filter f xs=[x|x<-xs,(f < x)==True] --the condition is optional

split 0=[]
--split x=[mod x 10]++armstrong(div x 10)

--PROLOG
{-John, Fred, Harry are men Mary Julie Susan Anne are women
John has blonde hair fred and harry have dark hair
Julie and susan are blonde mary and anne are brunette
Rich is each person who owns gold, fred and Julie own gold
Male like only female and vice versa
John and Harry like rich people
John likes blonde and fred likes brunette
Mary and Julie like dark hair persons
Julile likes rich persons


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


HIGHER ORDER FUNCTIONS
COMPOSITE FACT
details(author(sam),book(a_to_z)).
details(author(john),book(let's_cook)).

EXECUTE details(A,B). or details(author(X),B).

Execute following query: couple who like each other
like(A,B),like(B,A).



-}