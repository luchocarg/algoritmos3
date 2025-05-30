#image("image.png")

Sea $N=(V,E)$ un flujo, dos nodos distinguidos $s$ fuente, $t$ sumidero, $c$ una función de capacidad.

== a.

Queremos probar que $forall (u,v) in E ->_L c(u,v) equiv 0 (mod 2) ==> F_"max" equiv 0 (mod 2) $

Sea $S$ un corte, $T = V \\ S$


Con $S T = {(u,v) in E | u in S, v in T}$

Por definición, la capacidad de un corte $S$ es tal que
$ c(S) = sum_(e in S T) c(e) $

Y por hipótesis sabemos que $forall (u,v) in E ->_L c(u,v) equiv 0 (mod 2)$ por lo que para cualquier corte $S$:

$ c(S) = sum_((u,v) in S T) c(u,v) equiv 0 (mod 2) $

En particular, un corte mínimo $c(S') equiv 0 (mod 2)$

Y por teorema de flujo máximo/ corte mínimo sabemos que el flujo máximo es igual al corte mínimo.

$F_max = c(S') and c(S') equiv 0 (mod 2) ==> F_max equiv 0 (mod 2)$ 

$square.big$

== b.

Queremos probar que $forall (u,v) in E ->_L c(u,v) equiv 0 (mod 2) ==> exists F_max | e equiv 0 (mod 2), forall e in E$

Usando el inciso (a) sabemos que $forall (u,v) in E ->_L c(u,v) equiv 0 (mod 2) ==> F_"max" equiv 0 (mod 2) $

$F_max = max {F | f "es un flujo factible"}$.

Queda ver que  $exists F_max equiv 0 (mod 2) | forall f(u,v) equiv 0 mod 2, forall (u,v) in E$

*Veamoslo por inducción en las iteraciones de Ford Furkerson:*

*Hipótesis 1*: $forall (u,v) in E ->_L c(u,v) equiv 0 (mod 2)$

*Caso base*:

$forall (u->w) in E: f(u->w) = 0 equiv 0 mod 2$

*Paso inductivo*:

*HI* En la $k$-ésima iteración, $f_k (v,w) equiv 0 mod 2, forall (v,w)$ 

Veamos la iteración $k+1$-ésima

En cada iteración, el algoritmo encuentra $Delta (P) = min_(e in P) {Delta(e)}$

$ Delta (v->w) = cases(
  c(v->w) - f(v->w) &"si" (v->w) in E,
  f(v->w) &"si" (w->v) in E
) $

Por hipótesis 1 e hipótesis inductiva, $c(v->w) equiv 0 mod 2 and f(v->w) equiv 0 mod 2$

Por lo que $Delta (P) equiv 0 mod 2$

Y cada actualización de flujo cae en uno de estos 3 casos:
- $f_(k+1) (v->w) equiv_"HI" 0 mod 2$

- $f_(k+1) (v->w) + Delta(P) equiv_"HI" Delta(P) mod 2 equiv 0 mod 2$

- $f_(k+1) (v->w) - Delta(P) equiv_"HI" Delta(P) mod 2 equiv 0 mod 2$

Como queriamos probar, el flujo de toda arista se mantiene impar.

$therefore forall (u,v) in E, f(u,v) equiv 0 mod 2$ y en particular, $F_max = |f^*| equiv 0 mod 2$

$square.big$

*Nota*: esta demostración es mucho más sencilla trabajando sobre $ZZ "/" 2ZZ$.

== c.

Contraejemplo:

#image("image-1.png", height: 16em)

$F_max = 2$