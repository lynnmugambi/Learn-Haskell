--myadd a b = a+b -- is comment
-- {- multiple line comment -} 

mypro a z = a*z

myconvert x = -x -- to convert positive number to negative and vice versa

--Lab Tutorial week 3 1/11/2016

mydiv x y = if (mod x y ==0) then True else False

mypyth x y z | ((x*x) + (y*y) == z*z) = True | otherwise = False

mytriangle x y z | and [(x + y )> z, (y + z) >x, (z + x) > y] = True | otherwise = False

myseclarge x y z | and [x>y,x<z] =x 
		 | and [x<y,x>z] =x 
		 | and [y>x,y<z] = y 
		 | and [y<x,y>z] = y
		 | and [z>y,z<x] = z 
		 | and [z<y,z>x] = z 
		 | otherwise = x+y+z 

mysquarewave x | x>0 = 1 | x==0 = 0 | x<0 = -1

-- PATTERN MATCHING

--myand x y = False -- this line at top will cause the following code with same function name to not execute because every condition was being fulfil by this equation
--myand True True = True
--myand True False = False
--myand False True = False -- if this line is not available and you try to input myand False True, then it will provide pattern matching error
--myand False False = False
--myand x y = False --give error because input 

--myand _ _ = False , the wildcard _ _ will give same output as myand x y = Falsedata type is not equal to output data type

--Lab Week 4 8/11/2016
--use List Comprehension to return value one by one
evn n=[a|a<-[1..n],mod a 2==0]

evnn n=[a|a<-n,mod a 2 == 0] --shuould be a list

divisors n =[a | a<-[1..n],mod n a==0]

isprime n=if [a|a<-[1..n],mod n a==0] == [1,n] then True else False
--alternate solution
isprimee n =[a|a<-[1..n],mod n a==0] == [1,n]

--to calculate the number of occurance of n in ns(list)
ncount n ns=length [a|a<-ns,n==a]

--alternate solution
ncountt n ns=sum[1|a<-ns,n==a]

--Tuples
--every tuples must be exactly of same pattern
--order of type of data in tuples must be same
--number of data in tuples must be same
--different data type in tuples is allowed

stunames xs=[(y,z)|(x,y,z)<-xs,z>90] --show only tuples with mark greater than 90

stunamess xs=[(y,z,z>90)|(x,y,z)<-xs] --show all tuples but show true for mark greater than 90 and false for mark less than 90

stunamess xs=[(y,z,z>90)|(x,y,z)<-xs,z>90]
--show only tuples with mark greater than 90 and show true for mark greater than 90 and false for mark less than 90

mymultituples ns= [(x,y,z) | x <- [1..ns],y <- [x..ns], z<- [1..ns], x*x + y*y ==z*z]
--work in the way of nested for loop where
--for x
--	for y
--		for z

--to show number of repeats in two list
tuplesRepeat n1 n2=length [(x,y) | x <- n1,y <- n2, x==y]


--Week 5 Tutorial Recurssion
--Factoria and Fibonacci
fact 0=1
fact n=n*fact(n-1)

--take a list and return a total number
recurSum []=0
recurSum x = head x+recurSum(tail x)

isfound n xs=False
isfound n xs=if n == (head xs) then True else isfound n (tail xs)

islength []=0
islength n= 1 + islength(tail n) 

--dotpro function works like dot pro[1,7,4] [2,3] then (1*4)+(7*3)=25

dotpro x []=0
dotpro [] y=0
dotpro [] []=0
dotpro x y= head x * head y+dotpro(tail x) (tail y)

--dotlist function works like dotlist[1,7,4] [2,3] then answer is 1+2 and 7+3 = [3,10]

dotlist x []=[]
dotlist [] y=[]
dotlist x y=[head x*head y] ++  dotlist(tail x) (tail y)

--WEEK 5 NO LECTURE CLASS
--CURRIED FUNCTIONS- Week 6 Tutorial
--to get  the head(first value) without using head function
myhead (a:xs)=a

--get the value other than first value without using tail function 
mytail (a:xs)=xs

--get the last value without using last function
myylast [x]=x
myylast (x:xs)=myylast (xs)

--do dotpro using curried expression
mydotpro (x:xs) (y:ys)=(x)*(y)+dotpro(xs) (ys)

myinit [x]=[]
myinit (x:xs)=[x]++ myinit (xs)
--OR
--myinit (x:xs)=x:myinit(xs)

myzip (x) [] =[]
myzip [] (y)=[]
myzip (x:xs) (y:ys)=(x,y):myzip (xs) (ys)
myzip (x:xs) (y:ys)=[(x,y)] ++ myzip (xs) (ys)
--OR
myzipp [] xs=[]
myzipp xs []=[]
myzipp (x:xs) (y:ys)=(x,y):myzip (xs) (ys)

--return true if the value of the list is sorted
issort [x] = True
issort (x:y:xs)=if (x<y) then issort(y:xs) else False

--Quick Sort
quick []=[]
quick[x]=[x]
quick(x:xs) = quick[a|a<-xs,a<=x]++[x]++quick[a|a<-xs,a>x]

--Selection Sort
small [x]=x
small (x:y:xs)=if (x>y) then small(y:xs) else small(x:xs)

smallist (xs) =[a|a<-xs,a==small(xs)]

selSort []=[]
selSort xs=smallist(xs)++selSort([a|a<-xs,a/=small(xs)])

--merge
--merge xs []=xs
--merge [] ys=ys
merge (x) [] = x
merge [] (y)= y
merge (x:xs) (y:ys)=if (x<y) then [x]++merge(xs) (y:ys) else [y]++merge (x:xs) (ys)

--this is what i write -> sortt xs=take(div length(xs) 2) xs
--sort xs =sort(take (div (length xs) 2) xs)

sort [a]=[a]
sort [a,b]=if (a>b) then [b,a] else [a,b]
sort xs=merge(sort(take (div (length xs) 2) xs)) (sort(drop (div (length xs) 2) xs))

--Higher Order Function(new topic)
--function that takes other function as its parameter
--sqrt(sum(3,6)) is not HOF function

mymap f xs=[f x|x<-xs]
--if [f+x|x<-xs] , then f should be number

--filter function returns only true value
--filter f xs=[f x|x<-xs,(f x)==True] --thid function return true of false 
filter f xs=[x|x<-xs,(f x)==True] --return value

--Lambda function(new topic)
--Example:
--(\x->(x+1)) 5
--(\f->(\x->([f x|x<-xs]) 
--(\f->(\xs->([f x|x<-xs]))) even [1,2,3]
--Prototype

mysumm::Int->Int->Int
mysumm x y=x+y

split 0=[]
split x=[mod x 10]++armstrong(div x 10)

armstrong x=sum[n^3|n<-split x] ==x