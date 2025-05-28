= Flujos

Una red de flujos $G=(V,E)$ es un digrafo donde para todo $(u,v) in E$, $c(u,v)>=0$ y no existe $(v,u) in E$ con dos nodos distinguidos, $s$ (fuente) y $t$ (sumidero) donde $forall v in V$, existe camino $s ~> v ~> t$ en $G$

Más formalmente, un flujo es una función $f : E -> RR_(>=0)$

Donde por definición cumple:
- *Capacidad*: $forall (u,v) in E :: 0<= f(u,v) <=c(u,v)$ 
- *Conservación*: $forall v in V \\ {s,t}::$

$ sum_((u,v) in E) f(u,v) = sum_((v,w) in E) f(v,w)  $

*Nota*: nos referimos a que la suma del flujo de entrada es igual a la del flujo de salida.

Y el valor (neto) del *flujo* es, $forall u,v in V \\ {s,t}::$

$ F = |f| = sum_(v in E) f(s,v) = sum_(u in E) f(u,t) = $

== Propiedades
- Simetría: $f(u,v) = -f(v,u)$
- $f(X,X) = 0$ $X subset V$
- $f(X,Y) = -f(Y,X)$ $X,Y subset V$
- $f(X union Y, Z) = f(X,Z) + f(Y,Z) "si" X inter Y = emptyset$
- $F = f(s,V) = f(V,t)$


== Corte

- Un *corte* en le digrafo $G=(V,E)$ es una partición $(S,T)$ tal que $S subset.eq V \\ {s in S, t in.not S} "y" T=(V-S) subset.eq V \\ {t in T, s in.not T}$
- Dados $S,T subset.eq V$ podemos definir $S T = {(u,v) \\ u in S, v in T}$
- Sea $f$ un flujo definido en un digrafo $G =(V,E) "y" (S,T)$ un corte. Entonces el flujo a través del corte $f(S,T)$ es igual al flujo $F = f(s,V)$

=== Capacidad de un corte

$ c(S, T) = sum_(u in S) sum_(v in T) c(u,v)  $

== Corte mínimo

El *corte mínimo* de una red de flujos es un corte de capacidad mínima entre todos los cortes de la red.

== Teorema de corte mínimo / flujo máximo

Sea $f$ un flujo en una red de flujos $G=(V,E)$ con un vértice fuente $s$ y un sumidero $t$, es equivalente decir:

- $f$ es el flujo máximo de $G$
- La red residual de $G_f$ no tiene caminos aumentantes.
- $|f| = c(S,T)$ para algún corte $(S,T)$ en $G$




== Algoritmo de Ford - Fulkerson para flujo máximo

```
F-F(G,c,s,t):
  Inicializar el flujo

  while existe un camino de aumento (P) en R:
    for ij en P:
      if ij ∈ E:
        xij = xij + Δ(P)
      if not:
        xij = xij - Δ(P)
```


== Edmond-Karp

=== Lema 1:

Si se ejecuta *E-K* sobre una red de flujos $G=(V,E)$ con un nodo fuente $s$ y un nodo sumidero $t$, luego $forall v in V \\ {s,t}::$ la distancia del camino mínimo $delta_f(s,v)$ en la red residual $G_f$ incrementa de forma monótona con cada flujo aumentante.

=== Lema 2:
El total de flujos aumentantes está acotada por $O(V E)$

=== Nota
E-K es $O(V E^2)$ (BFS con FF)

== Matching bipartito

=== Lema 3:

Sea $G=(V,E)$ un grafo bipartito con $V = L union R$ y sea $G' = (V',E')$ es la red de flujos de $G$.

Si $M$ es un matcheo en $G$, entonces existe un flujo $f$ en $G'$ tal que $|f| = |M|$. Intuitivamente, $f$ es un flujo en $G'$, entonces hay un matching $M$ en $G$ con cardinalidad $|M| = |f|$

