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