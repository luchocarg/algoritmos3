#image("image.png")
#line(length:100%)
#image("image-1.png")
$checkmark$
#line(length:100%)
#image("image-2.png")

Sea $p = {p_1 ... p_n}$
$
"mgn"_p (j,c) = cases(
    -infinity &"si" c<0 or c>j,
    0 &"si" j=0 and c=0,
    max cases("mgn"_p (j-1,c+1)+p_j ,"mgn"_p (j-1,c-1)-p_j ,"mgn"_p (j-1,c) ) &"sino"
)
$

#line(length:100%)
#image("image-3.png")

Se resuelve con $"mgn"_p (n,0)$

#line(length:100%)
#image("image-4.png")

```typc
f solve(p):
    memo = {}
    n = |p|

    f bt(j,c):
        si c < 0 ó c > j:
            ret -inf
        si j = 0 y c = 0:
            ret 0
        si memo[j][c] existe:
            ret memo[j][c]
        sino:
            memo[j][c] = max(bt(j-1,c+1)+p[j],bt(j-1,c-1)-p[j],bt(j-1,c))
            return memo[j][c]

    bt(n,0)
```

La complejidad espacial es tal que $0<=j<=n, 0<=c<=n => O(n^2)$

La complejidad temporal está limitada por la espacial, cada llamada recursiva es $O(1)$ y se hace máximo $n^2$ veces.

#line(length:100%)
#image("image-5.png")

```typc
f solve(p):
    n = |p|
    old = actual = [-inf]*n
    old[0] = 0
    
    para cada j en [1...n]:
        para cada c en [0...j]:
            actual[c] = old[c]
            si 0 < c: actual[c] = max(actual[c], old[c-1]-p[j-1])
            si c < j: actual[c] = max(actual[c], old[c+1]+p[j-1])

        para cada c en [j+1...n]:
            actual[c] = -inf

        old, actual = actual, old

    ret old[0]
```

La complejidad temporal es $O(n^2)$, hago $n$ loops de tamaño $1,2,...,n =>$ $sum_(j=0)^n j = (n^2+n)/2 in O(n^2)$

La complejidad espacial, como guardamos solo el nivel anterior y el actual, es $2 dot n in O(n)$

