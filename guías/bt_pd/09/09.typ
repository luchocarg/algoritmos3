#image("image.png")

#line(length:100%)

#image("image-1.png",width: 85%)
$checkmark$
#line(length:100%)

#image("image-2.png")
$checkmark$
#line(length:100%)

#image("image-3.png")

$ "TV"_A = cases(
  infinity &"si" (i>n and j!= m) or (j>m and i!=n),
  0 &"si" (i=n+1 and j=m) or (i=n and j=m+1),
  "minSig"(i,j) &"si"  "minSig"(i,j) > 0,
  1 &"sino"

) $

$ "minSig"(i,j) = min("TV"_A (i+1,j),"TV"_A (i,j+1))-A_(i j) $


minSig solo es para que sea menos verboso.

El primer caso devuelve infinito si "se va del tablero", pero el caso anterior no fué $A_(n m)$

El segundo caso solo es un caso base para decir que ya pasó $A_(n m)$

El tercer y cuarto caso son lo explicado en el punto (b)

Asumiendo que es 1-indexed, se resuelve con $"TV"_A (1,1)$

#line(length:100%)

#image("image-4.png")

== Top-down
```
f solve(A, n, m):

  memo = matriz n*m de valor nulo
  
  f tv(i,j):
    if (i>n and j!=m) or (j>m and i!=n):
      ret inf

    if (i=n+1 and j=m) or (i=n and j=m+1):
      ret 0

    if memo[i][j] no es nulo:
      ret memo[i][j]

    minSig = min(tv(i+1,j),tv(i,j+1))-A[i][j]

    if minSig > 0:
      memo[i][j] = minSig
    else:
      memo[i][j] = 1
    
    ret memo[i][j]

  ret tv(0,0)
```

Complejidad espacial: es una matriz de $n dot m$ y la pila de recursiones está limitada por la cantidad de estados posibles, que es $n dot m$, entonces es $O(n dot m)$

Complejidad temporal: también limitada por la cantidad de estados, dado que cada recursión es $O(1)$, nos queda $O(n dot m)$

== Bottom-up

*Nota:* lo hice 1-indexed.

```
f solve(A, n, m):

  si n>=m:
    memo = [inf]*(n+1)
    memo[n] = 1

    para cada i en n...1:
      para cada j en m...1:
        memo[i] = max(1,min(memo[i],memo[i+1]) - A[i][j])

  sino:
    memo = [inf]*(m+1)
    memo[m] = 1

    para cada j en m...1:
      para cada i en n...1:
        memo = max(1,min(memo[j],memo[j+1]) - A[i][j])

  ret memo[1]
```

Complejidad espacial auxiliar: es un vector de tamaño $min(n dot m) => O(min(n dot m))$

Complejidad temporal: en ambas opciones posibles son dos for loops anidados de $O(n dot m)$

#line(length:100%)

#image("image-5.png")

Está en el item anterior.

Implementación:

```python
  if n < m:
      A = list(zip(*A))
      n, m = m, n

  memo = [float('inf')]*(m+1)
  memo[m-1] = 1

  for i in reversed(range(n)):
      for j in reversed(range(m)):
          memo[j] = max(1, min(memo[j],memo[j+1]) - A[i][j])

  return memo[0]
```