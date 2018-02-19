--BASIC OPERATIONS IN HASKELL

sum1 a b = a + b

--this is a single line comment
{-this is 
a multiline comment-}

hyp x y = sqrt (x^2 + y^2)
 
mytrial x = sum x 

fac x = product[1..x]


--CONDITIONAL STATEMENTS

big x y = if (x>y) then x else y

big2 x y z = if (x>y) then (if (x>z) then x else z) else (if (y>z) then y else z)
--or
big3 x y z = big (big x y) z --edit big method
--or
big4 x y z = if(and [x>y , x>z]) then x else (if(y>z) then y else z)

--or use guards
big5 x y |(x>y) = x
	     |(y>x) = y
		 |otherwise = x --default condition
		 
		 
big6 x y z |and[x>y,x>z] = x
		   |(y>z)= y
		   |otherwise = z
 --end
 
signum a = if(a>0) then 1 else 0 
--when testing negative numbers put in parantheses



--LIST COMPREHENSION

--[x|x <- [10..15], mod x 3 == 0] output is 12,15

listeven n = [x|x<-[1..n], mod x 2 == 0] --output is all even numbers btwn 1 and 'n'

findeven n = [x|x<-n, mod x 2==0]

divisors n = [x|x<-[1..n], mod n x==0] 

isprime n = [x|x<-[1..n], mod n x==0]==[1,n]
-- if length(divisors n )==2 then True else False
-- length (divisors n) <= 2
-- divisors n == [1,n]

listprime xs = [x|x<-xs,isprime x] --returns a list of prime numbers within given input

detprime xs = [isprime x | x<-xs] --returns bool on whether the numbers in the list are primes or not

detprenz xs = [x|x<-xs,or[isprime x,mod x 2==0]]--returns prime or even numbers

detprimeneven xs = [x|x<-xs,isprime x ,mod x 2==0]--returns prime and even numbers

--[(x,y)| x<-[1..3],y<-[10,11,12]] // output acts like a simultaneous equation

listispyth n = [(x,y,z) | x<-[1..n],y<-[x..n],z<-[1..n], x^2 + y^2 == z^2]

check n xs = [x | x<-xs, n==x] 
check3 n xs = [True | x<-xs, n==x]
check2 n xs = length[x | x<-xs, n==x]>0
check4 n xs = or[x==n|x<-xs]

--zip [1..3][1..3] --returns corresponding pairs of elements ie (1,1),(2,2)...

issorted xs = [x | x<-zip xs(tail xs)]



--RECURSION

fact 0 = 1
fact n = n*fact(n-1)

--fibonacci series is where n is a sum of its 2 predecessors
fib 1 = 0
fib 2 = 1
fib n = fib (n-1) + fib (n-2) --multilevel recursion

me 1 = False
me 0 = True

me n = mo (n-1) --multifuntional recursion
mo n = me (n-1)


--CURRIED FUNCTIONS

myhead [] = "no values implemented"
myhead (x:xs) = x --returns the  first element of a list

mysum [] = 0
mysum xs = head xs + mysum (tail xs)
--or
mys [] = 0
mys (x:xs) = x + mys xs

mylast [x] = x
mylast (x:xs) = mylast xs
--or
myl (x:xs) = if (length xs == 0) then x else myl xs

myinit [x] = []
myinit (x:xs) = [x] ++ myinit xs
--or
myin [x] = []
myin (x:xs) = (x:(myin xs)) --alternative method

pick n xs = (!!) xs (n-1)
--or
--PIC 1 (X:XS) = X can be used in place of the if else statement
pic n (x:xs) = if n==1 then x else pic (n-1) xs



--LAMBDA FUNCTIONS
--anonymous variables..single time use 

--(\x->(x+1)) 4 --- increments value given also, inc c = c+1

--(\x->(\y->(x+y))) 4 5 --- sum of two values

--(\xs -> ([x|x<-xs, even x])) [1,2,3,4,5] -- finds even numbers


isfound n l = if length([x|x<-l,x==n])>0 then True else False
{-
count = 0
getlength n = if (not(n==[]))
				then do
					let count = count + 1
					getlength(tail(n)
				else return(count)
getlengths n = sum[1|x<-n]
-}
pairs xs = zip xs (tail xs)
listnames xs = [y|(x,y,z)<-xs]
issorted xs = and[(x<=y) | (x,y)<-pairs xs]

dotpro k j = sum[x*y|(x,y) <- zip k j]








