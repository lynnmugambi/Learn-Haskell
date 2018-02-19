
isdiv a b = if (mod a b == 0) then True else False

isdivs a b | mod a  b == 0 = True | otherwise = False

ispyths x y z = if (x*x + y*y == z*z) then True else False

istriangle x y z | and [(x+y)>z, (y+z)>x, (z+x)>y] = True | otherwise False

--seclarge a b c | and [(a>b),(a<c)] = a 