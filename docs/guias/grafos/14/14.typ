#image("image.png")
#line(length: 100%)
#image("image-1.png")

Si todos $v$ tiene grado mayor a 0, entonces puedo construir un camino hasta algún $v_k$ $p={v_1...v_k}, k<=n$ donde no tengo ciclos, pero en el caso $v_n$ o antes tendré algún $v_(k+1) = v_i in {v_1...v_(k-1)}$ ya que $d(v_(k+1)) >0$

#line(length: 100%)

#image("image-2.png")

```
f solve(G,v): 
  armo E(G) lista de aristas //O(m)
  armo vector visitado de tamaño n iniciado todo en False //O(n)

  para cada (u,w) in E(G): //O(m)
    if not visitado[u]:
      visitado[u] = True
    if not visitado[w]:
      visitado[w] = True
    if visitado[u] or visitado[w]:
      return "hay ciclo"
  
  return "no hay ciclo"
```

#line(length: 100%)

#image("image-3.png")

hecho item anterior, es $O(m+n+m) in O(n+m)$
#line(length: 100%)

#image("image-4.png")

Si $D$ es trivial luego es aciclico.

Caso interesante:

$(==>)$

Hipótesis: $D$ no tiene ciclos.

Quiero ver que $D$ tiene un $d_"out" (v)= 0$ tal que $D-{v}$ no tiene ciclos.

Por hipótesis, $D$ no tiene ciclos, si elimino $v$ de $V$ luego también cada arista $u->w in E$, entonces el grafo no suma aristas, por lo que sigue siendo aciclico.


$(<==)$

$D$ tiene un $d_"out" (v)= 0$ tal que $D-{v}$ no tiene ciclos.

Tengo $D-{v}$ sin ciclos, si agrego $v$ luego independientemente de $d_"in" (v)$, $d_"out" (v)= 0$ entonces $D$ es aciclico también. 

Q.E.D.
