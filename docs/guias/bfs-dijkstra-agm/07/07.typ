#image("image.png")

== Algoritmo

```
Algoritmo(G,c,s,t)
  ds <- Dijkstra(G,s)
  G' <- G con las aristas invertidas
  dt <- Dijkstra(G,t)

  res = (-1,-1) //asumiendo que -1 no es un nodo
  peso = -1

  Para cada v en G:
    Para cada w en G[v]:
      Si ds[v] + costo(v->w) + dt[w] ≤ c:
        si costo(v->w) > peso:
          peso <- costo(v->w)
          res <- (v,w)

  return res
```

== Correctitud

`ds` Por Dijkstra tenemos que es un vector de caminos mínimos de _s_ a _v_ $forall v in V(G)$

`dt` análogo al anterior pero de _t_ a cada nodo incidente.

*Bucle*

`Para cada v en G: Para cada w en G[v]:` vemos cada arista $v->w in G$ tal que 

*Invariante*: en la k-esima iteración, peso es el costo de la arista válida con peso máximo $v->w$ tal que  `ds[v] + costo(v->w) + dt[w] ≤ c`

Probemos que vale por inducción.

*Caso base $k=0$*

` res = (-1,-1), peso = -1`, asumimos que -1 no es un nodo, y que (-1,-1) representa que no hay solución. Como no hay pesos negativos, cualquier número negativo es menor que uno positivo.

Como todavía no encontramos una arista válida, el invariante vale. 

*Paso inductivo*

`peso` y `res` son el peso máximo y la arista válida de ese peso hasta la k-ésima iteración. $v->w$ es la arista k+1-ésima

Si $v->w$ cumple `ds[v] + costo(v->w) + dt[w] ≤ c` entonces existe camino $P= s...v w...t$ tal que el peso de $P$ es menor o igual a $c$ tal que:
-  `si costo(v->w) > peso` entonces $v->w$ es la arista de peso máximo, por lo que actualizamos `peso = costo(v->w)` `res = v->w`, luego finaliza la iteración se mantiene el invariante.

Caso contrario, no se actualizan `peso` ni `res`, se mantiene el invariante.

Como el invariante se mantiene en todas las iteraciones, al finalizar el bucle, `res` será la arista de peso máximo tal que existe en un recorrido de _s_ a _t_ cuyo peso es como mucho _c_, o bien (-1,-1) si no existe arista válida.