#image("image.png")

```typc
f solve(G,D):

  n = |V(G)|

  si |D| > |V(G)|:
    return False

  M = FW(G)
  
  Para cada v ∈ D:
    Para cada w ∈ D:
      Para cada i ∈ [1..n]:
        si M[v][w] == M[v][i]+M[i][w]:
          I = I ∪ {i} 

  return (I == V(G))

```

Justificación de complejidad:

_Floyd-Warshall_ es $O(n^3)$, luego tenemos 3 bucles anidados $O(D dot D dot n)$, pero por el primer condicional, $D$ es como mucho $V(G), |V(G)| = n$, entonces es $O(n^3)$


Correctitud del algoritmo:

`si |D| > |V(G)|: return False` nos asegura que el conjunto $D$ no puede ser más grande que $V(G)$ ya que si lo fuese, entonces no es geodésico.

`M = FW(G)` $M$ es una matriz _Floyd-Warshall_ de $G$.

Luego vemos cada arista con $v,w in D$, y $forall i in V, v->...->i->...->w$ es recorrido mínimo, por _Floyd-Warshall_, sabemos que cada $v->i$ es el mínimo recorrido de $v$ hasta $i$, análogo para $i->w$, entonces es suficiente con ver que el camino $v->w$ es igual a cada camino que pasa por cada otro nodo $i in D$.

Si cada nodo _Floyd-Warshall_-óptimo está en $I$, luego $I=V(G)$ y por lo tanto, $D$ es geodésico.