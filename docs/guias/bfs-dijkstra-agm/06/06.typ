#image("image.png")
#line(length: 100%)

#image("image-1.png")

*Teorema* $v->w$ es _st_-eficiente $<==> d(s,v) + c(v->w) + d(w,t)=d(s,t)$

$(==>)$

Hipotesis: Sabemos que $v->w$ existe en algún camino mínimo de _s_ a _t_ con $d(s,t)$

Y por propiedad del camino más corto sabemos que $d(s,v)+d(v,w)+d(w,t)$, y sabemos que $v->w$ está en un camino mínimo de _s_ a _t_ por hipótesis, por lo que $d(v,w) = c(v->w)$ tal que 

$d(s,v) + c(v->w) + d(w,t) = d(s,v) + d(v,w) + d(w,t) = d(s,t)$

$(<==)$

Hipotesis: $d(s,v) + c(v->w) + d(w,t)=d(s,t)$

Si $d(s,v) + c(v->w) + d(w,t)=d(s,t)$ entonces $v->w$ existe en un camino mínimo de _s_ a _t_, por lo que es _st_-eficiente.

#line(length: 100%)

#image("image-2.png")

```
Asumo G como lista de adyacencia.

Algoritmo(G):
  ds <- Dijkstra(G,s) que devuelve los caminos minimos desde s a todos

  G' <- G con las aristas invertidas
  dt <- Dijkstra(G',t) que devuelve los caminos minimos desde t a todos

  Gout <- conjunto vacio 

  para cada v en G:
    para cada w en G[v]:
      si ds(v) + c(v->w) + dt(w) != ds(t):
        agrego (v,w) a Gout

  res <- Dijkstra Gout

  si res es vacio:
    return ⊥
  sino:
    return res
```

La idea del algoritmo es ver que hay camino tal que no hay arista $c(v->w) = d(v,w)$ y necesariamente haya un camino $P = v...w$ diferente a $v->w$ que sea mínimo.