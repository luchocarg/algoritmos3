#image("image.png")
#image("image-1.png")
#line(length: 100%)

#image("image-2.png")
$checkmark$
#line(length: 100%)

#image("image-3.png")
$C = {c_1...c_n}, c_1 < ... < c_n$

$
 "CE"_C (i,j) = cases(
    0  &"si" exists.not c in C | i<c<j,
    j-i+min_((c in C) ->_L (i<c<j)) cases("CE"_C (i,c), "CE"_C (c,j))  &"sino"
 )
$

Se resuelve con $"CE"_C (0,|C|+1)$

#line(length: 100%)

#image("image-4.png")

*Top-down*
```typc
f solve(C):
  memo = []
  f CE(i,j):
    si no existe C[k] :: i<k<j: //O(1)
      ret 0

    si existe memo[i][j]:
      ret memo[i][j]
    
    min_costo = inf

    para cada k in [1...n]: //O(n)
      si i < C[k] < j:
        min_costo = min(min_costo, j-i + min(CE(i,C[k]),CE(C[k],j)))
    
    memo[i][j] = min_costo
    ret memo[i][j]

```
Complejidad espacial, $(0<=i,j<=n) => O(n^2)$ 

Cada nodo del árbol de recursión es $O(n)$, y por `memo`, hay máximo $n^2$ llamados, luego es $O(n^3)$ 

*Bottom-up*
```

f solve(C):
  para cada l en [1...n]:
    para cada i en [0...n-l]:
      j = i+l
      memo[i][j] = -inf 


```
#line(length: 100%)



#image("image-5.png")