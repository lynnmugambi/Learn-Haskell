mysums a b = a+b
mypro a z = a*z
{-
hi
hello
-}
change a = -a
change -b = b

big x y = if (x>y) then x else y

sim a b = if (a>b) then "True" else "False"

mie x y z = big x (big y z)

mie2 x y z = if (x>y) then (if (x>z)then x else z)
                      else (if (y>z)then y else z)

mysignum x = if (x>0) then 1 else 0

isdiv x y = if (mod x y ==0) then True else False

isdi x y = mod x y 

bigg x y| (x>y) = x
	| otherwise = y

bigs x y|(x>y) = x
	|(x<y) = y

bigso x y z | and [x>y,x>z] = x
	    | and [y>x, y>z] = y
	    | otherwise = z

bigsos x y z | and [x>y,x>z] = x
	     | y>z = y
	     | otherwise = z

f1 a = a+1
f2 a = head a 
f3 a = sum a

even n = [a|a<-[1..n], mod a 2 == 0]
evens x = [a|a<-x, mod a 2 ==0] 
--divisors is a number that can divide by itself
divisors n = [a|a<-[1..n], mod n a == 0]

isprime n = if [a|a<-[1..n], mod n a == 0] == [1,n] then True else False
isprimes n = if (length (divisors n) ==2) then True else False
ncount x xs = length [a|a<-xs, x==a] 
nc x xs = sum[1|a<-xs, a==x]
--there u mention only y
stunames xs = [y|(x,y,z)<-xs]
stuname xs = [(y,x)|(x,y,z)<-xs, z>90]

--nested list comprehension
pyth n = [(a,b,c) | c<-[1..n],b <-[1..c], a<-[1..b], a^2 + b^2 == c^2]
--in the case of c<-[b..n] means that b will be less than c

repeat xy xz = length [1| a<-xy, b<-xz, a==b]

--recursion help u do repeating


--fib n = [a|a <-[1..n]]

fact 0 = 1
fact n = n*fact(n-1)













