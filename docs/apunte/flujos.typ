= Flujos

Una red de flujos $G=(V,E)$ es un digrafo donde para todo $(u,v) in E$, $c(u,v)>=0$ y no existe $(v,u) in E$ con dos nodos distinguidos, $s$ (fuente) y $t$ (sumidero) donde $forall v in V$, existe camino $s ~> v ~> t$ en $G$


== Propiedades

- Capacidad: $0<= f(u,v) <= c(u,v)$
- Conservación: $forall u in V-{s,t}$
  $ sum_(v in V) f(u,v) = 0 $
- Simetría: $f(u,v) = -f(v,u)$
- Flujo (neto): $F = |f| = f(s,V) = sum_(v in V) f(s,v)$
- $f(X,X) = 0$ $X subset V$
- $f(X,Y) = -f(Y,X)$ $X,Y subset V$
- $f(X union Y, Z) = f(X,Z) + f(Y,Z) "si" X inter Y = emptyset$
- $F = f(s,V) = f(V,t)$


== Corte

- Un *corte* en le digrafo $G=(V,E)$ es una partición $(S,T)$ tal que $S subset.eq V \\ {s in S, t in.not S} "y" T=(V-S) subset.eq V \\ {t in T, s in.not T}$
- Dados $S,T subset.eq V$ podemos definir $S T = {(u,v) \\ u in S, v in T}$
- Sea $f$ un flujo definido en un digrafo $G =(V,E) "y" (S,T)$ un corte. Entonces el flujo a través del corte $f(S,T)$ es igual al flujo $F = f(s,V)$
