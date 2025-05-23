#image("image.png")

== Algoritmo 

```
Algoritmo(G,E):
  ds <- Dijkstra(G,s) //O(E(G)+V log V)
  G' <- G con las aristas invertidas
  dt <- Dijkstra(G',t) //O(E(G)+V log V)

  res <- conjunto vacio

  Para cada (v->w) en E: //O(E)
    Si ds[v]+costo(v->w)+dt[w] < ds[t]:
      res <- res union v->w

  return res

Complejidad final: O(E + E(G) + V log V) 
```

== Correctitud

Defino $P = {s...t}$, el camino de s hasta t en $G$

`ds` y `dt` por Dijkstra sabemos que son correctos y devuelven los caminos mínimos de _s_ a todo _v_ en $V(G)$, y de _t_ a todo nodo _v_ en un camino $v->...->t$ respectivamente.

=== Ciclo 
Vemos para cada arista $v->w in E in.not E(G)$


*Invariante de ciclo:* $d(s,v)+c(v->w)+d(w,t) < d(s,t) ==>_L "res" = "res" union v->w $

En palabras, si existe arista $v->w$ que mejora el camino mínimo de _s_ a _t_ entonces la arista existe en el output `res` (además será _st_-eficiente).

*Inducción en la cantidad de iteraciones $k$*

*Caso base $k=0$:*

`res` = $emptyset$, todavía no encontramos ninguna arista que mejore el camino $s->...->t$ por lo que se preserva el invariante.

*Paso inductivo$k=>k+1$:*

En la k-ésima iteración, `res` representa el conjunto de todas las aristas de $E$ que mejoran $P$.

Queremos ver en la iteración k+1, la arista $v->w in E$.

Si $d(s,v)+c(v->w)+d(w,t) < d(s,t)$ entonces $v->w$ mejora $P$, por lo que agregamos $v->w$ a `res`.
Caso contrario, no agregamos nada a `res`. Vale el invariante.

Esto vale porque por propiedad de camino más corto, $d(s,v)+d(v,w)+d(w,t)=d(s,t)$ en $G$, y si mejora el camino entonces en particular $c(v->w)_(G+e) < d(v,w)_G$