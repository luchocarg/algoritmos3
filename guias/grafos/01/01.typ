#import emoji: face

= Enunciado

Demostrar, usando inducción en la cantidad de aristas, que todo digrafo $D$ satisface

$ sum_(v in V(D)) d_"in" (v) = sum_(v in V(D)) d_"out"(v) = |E(D)| $

= Solución

Tenemos: 

- $d_"in" (v)$ es la cantidad de aristas $u -> v in E$.
- $d_"out" (v)$ es la cantidad de aristas $v -> u in E$.

Por comodidad, llamo $|E(D)| = m$

== Por inducción en $m$:

=== Hipótesis Inductiva:
$forall D'$ con $m-1$ aristas:
$ P(m-1): sum_(v \in V(D')) d_"in" (v) = sum_(v \in V(D')) d_"out" (v) = m-1 $


=== Caso Base: $m = 0$

$ P(0): E = emptyset => forall v in V(D),\ d_"in" (v) = d_"out" (v) = 0 $

Luego:

$ sum_(v in V(D)) d_"in" (v) = sum_(v in V(D)) d_"out" (v) = 0 $


=== Paso Inductivo: $P(m-1) => P(m)$

Sea $D' = (V, E')$ con $E' = E without (u -> w)$ con $u,w in V$

Por H.I.:

$ sum_(v in V(D')) d_"in" (v) = sum_(v in V(D')) d_"out" (v) = |E'| = m-1 $

Luego agregamos $(u -> w) $ a $D'$ y vemos:

- $d_"out" (u)$ aumenta en 1 tal que $sum d_"out" = (m - 1) + 1 = m $
- $d_"in" (w)$ aumenta en 1 tal que $sum d_"in" = (m - 1) + 1 = m $

Por lo tanto:
$ sum_(v in V(D)) d_"in" (v) = sum_(v \in V(D)) d_"out" (v) = m = |E(D)| $


Entonces, por inducción, vale $forall m$ $face.cool$