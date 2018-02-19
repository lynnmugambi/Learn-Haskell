mysum[] = 0
mysum x = head x + mysum (tail x)

isfound n [] = False
isfound n xs = if n == (head xs) then True else isfound n (tail xs)

mylen [] = 0
mylen xs = 1 + mylen(tail xs)

dotpro [] []= 0
dotpro xs [] = 0
dotpro [] ys = 0
dotpro xs ys = (head xs * head ys) + dotpro(tail xs)(tail ys)

--the output should be in array not in number
dotl [] ys = []
dotl xs [] = []
dotl xs ys = [head xs * head ys] ++ dotl (tail xs)(tail ys)


--11/22/2016
myf(a:b:c:xs) = xs

myhead (x:xs) = x

mytail (x:xs) = xs

mylast [x] = x
mylast(x:xs) =mylast(xs)

dotpros[] xs = 0
dotpros xs[] = 0
dotpros xs ys = (head xs)*(head ys) + dotpros(tail xs)(tail ys)

dotproo [] xs = 0
dotproo xs [] = 0
dotproo (x:xs) (y:ys) = (x)*(y) + dotproo (xs) (ys)

myinit [x]=[]
myinit (x:xs)= [x] ++ myinit (xs)
--or
myinits [y]=[]
myinits (y:ys)= y :myinits (ys)

myzip [] xs = []
myzip xs [] = []
myzip (x:xs) (y:ys) = ((x,y) : myzip xs ys)

issort [] = True
issort [s] = True
issort (x:y:xs) = if (x<y) then issort (y:xs) else False

quicksort [] = []
quicksort [x]=[x]
quicksort (x:xs) = quicksort[a|a<-xs, a<=x] ++[x]++ quicksort[a|a<-xs,a>x]

selection []=[]
selection [x]=[x]
selection (x:xs) = selection[a|a<-xs, a<=x] ++ [a|a<-xs,a>x]

--finding the smallest number
smallest [x]=[x]
smallest (x:y:xs) = if (x<y) then smallest (x:xs) else smallest (y:xs)

--list all smallest number
smlist (xs) = [a|a<-xs, [a] == smallest(xs)]

--select all the smallest number
selectsort [] = []
selectsort xs = smlist xs ++ selectsort [a|a<-xs, [a] /=smallest(xs)]

--merge number
merge xs[] = xs
merge []ys = ys
merge (x:xs) (y:ys) = if (x<y) then [x] ++ merge xs (y:ys) else [y] ++ merge (x:xs) ys

sort [a]=[a]
sort [a,b]=if (a>b) then [b,a] else [a,b]
sort xs = merge (sort (take (div(length xs) 2) xs))
		(sort (drop(div(length xs)2)xs))

mymap f xs = [f x | x<-xs]

filter f xs = [n | n<-xs, f n == True]

--filter only return true or false

