= Enunciado

Demostrar, usando la técnica de reducción al absurdo, que todo grafo no trivial tiene al menos dos vértices del mismo grado. 

*Ayuda*: prestar atención a la secuencia ordenada de los grados de los vértices.

= Solución

== Hipótesis:

Dado $G = (V,E)$ con $|V| = n >= 2$

Queremos ver que $forall G :: exists u,v in G | d(u) = d(v)$

=== Demostración por absurdo 

Supongamos que $exists G :: exists.not u,v in G | d(u) = d(v)$, luego:

$forall u,v in V:: 0<=d(v),d(u)<=n-1$ ya que es $G$ es grafo, y un nodo no puede estar conectado a si mismo.

Intentemos *construir* un grafo con todos los vértices de grado distinto con $n$ nodos

$d(v_1) = 1 \ d(v_2) = 2 \ d(v_3) = 3, \ dots \  d(v_(n-2)) = n-2 $

Pero tenemos $n$ nodos, nos quedan $v_n$ y $v_(n-1)$ al que por comodidad llamaré $u$

Quiero ver que es imposible que $d(u)=0 and d(v)=n-1$ (o viceversa):

Si $d(v) = n-1 =>$ $v$ está conectado a todos los nodos del grafo (excepto si mismo), por lo tanto, $d(u) != 0$

Si $d(u) = 0 =>$ ningún nodo está conectado a $n-1$ nodos, luego $d(v) != n-1$

Pero entonces $d(u) = d(v) = n-1 or d(u) = d(v) = 0$ y esto es *absurdo*!

Por lo tanto, queda demostrado por reducción al absurdo que $forall G :: exists u,v in G | d(u) = d(v)$