#image("image.png")

Podemos modelarlo tal que:

Armamos un $G=(V,E)$

Cada posible vuelto $v_i = i, forall 0<=i<=v$ es un nodo de $V$

Y tenemos $v_i ->(v_(i+w_i)) in E$ con $c(u->w)= 1 , forall (u->w) in E$

*Nota:* _En el ejemplo podemos ver que el camino minimo es $v_0->_(+1)v_5->_(+1)v_10 ->_(+1) v_15$_

Una vez tenemos el grafo armado, notamos que es un DAG, luego podemos recorrerlo de forma lineal:

`
ady = lista de adyacencias de G //viene dado o armarla es O(n+m)

pred = []*v

//esto es O(n+m)
for u in ady:
  for v in ady[u]:
    pred[v].add(u)

//O(n+m), es un toposort
ord = posorder(DFS(G))

memo = [inf]*v //O(v)
memo[0]=0

f rec(v)
  si v = 0:
    ret 0
  
  si memo[v] != inf:
    ret memo[v]

  para u en pred[v]:
    memo[v] = min(1+rec(u),memo[v])

  ret memo[v]
  
rec(v) es el resultado //O(v) (está acotado)

`

Luego nos queda $O(v k + (n+m) + v) in O(v k + (n+m))$ y $n = v, m=k =>$ es $O(v k + v+k) in O(v k)$