== (A)

*Función recursiva*

$

  f(i,s)= cases(
    0 &"si" s <0 or i<0,
    1 &"si" s = 0 and i=0,
    sum_(j=1)^k f(i-1, s-j) &"sino"
  )

$

```python
#Inicializo una matriz n*s
memo = [[-1 for _ in range(s+1)] for _ in range(n+1)]

def f_td(i, s):
    #Casos base
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1

    #Caso recursivo
    if memo[i][s] != -1: return memo[i][s]

    memo[i][s] = sum(f_td(i-1, s-j) for j in range(1, k+1))

    return memo[i][s]
```

$O(n dot s)$

== (B)

*Función recursiva*

$
  g(i,s,k) = cases(
    0 &"si" s < 0 or i < 0,
    1 &"si" s=0 and i=0,
    sum_(j=1)^k g(i-1,s-j,j) &"sino"
  )
$

```python 
#Inicializo una matriz de n*s*k
memo = [[[-1 for _ in range(k+1)] for _ in range(s+1)] for _ in range(n+1)]

def g_td(i, s, k):
    #Casos base
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1
    
    #Caso recursivo
    if memo[i][s][k] != -1: return memo[i][s][k]
    
    memo[i][s][k] = sum(g_td(i-1, s-j, j) for j in range(1, k+1))

    return memo[i][s][k]

```

$O(n dot s dot k)$
