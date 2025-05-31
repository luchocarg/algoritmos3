#image("image-1.png")

= a.

Sea $G=(V,E)$

Sea $K$ el conjunto de aristas que existen en algún camino dirigido de $s$ a $t$ en $G$.

Armamos nuestra red de flujos $N=(V,K)$

$forall (u->v) in K:: c(u->v) = 1$

$s$ es _fuente_, $t$ es _sumidero_

= b.

Cada unidad de flujo es un camino disjunto de $s$ a $t$

La restricción de capacidad $1$ nos limita a que cada arista pertenezca a lo sumo a un camino.

$F_max$ es la cantidad de caminos disjuntos en $N$.
= c.


== $N$ es una red válida.

Probemos que no hay ciclos ni aristas bidirecciones, por el absurdo.

Supongamos que tenemos dos caminos arbitrarios $P_1$ y $P_2$

$ P_1 = s,...v, ... ,w,...,t $

$ P_2 = s,...w, ..., v,...,t $

O sea, $(v...w) in P_1$ y $(w...v) in P_2$

Y sabemos que $K = P_1 union P_2 union ...  union P_k$

Por lo que si existe ciclo en $K$ $v...w...v$ lo cual no es óptimo, entonces uno de los 2 no es mínimo. Por lo tanto, no existen aristas bidireccionales en $K$.

Esto en particular significa que tampoco existe ciclo $v->w->v$, por lo que si $(v->w) in K => (w->v) in.not K$, por lo que no hay aristas bidireccionales.

Por lo tanto, $N=(V,K)$ es una red válida.

== El Modelo es correcto.

Máxima cantidad de caminos disjuntos $<==>$ Flujo máximo

=== Máximo cantidad de caminos disjuntos $==>$ Flujo máximo

Si hay $n$ caminos disjuntos, como $c(e)=1, forall e in E$ no podremos enviar más de $n$ unidades de flujo, ya que si pudiese mandar $n+1$, entonces $n$ no era el máximo de caminos disjuntos.

=== Flujo máximo $==>$ Máximo cantidad de caminos disjuntos

Tenemos un flujo máximo $F_max in NN_(0)$, y como todas las aristas tienen capacidad 1 o 0:

Por conservación de flujo no podemos tener más de una arista incidente que entregue flujo, ya que siempre sale exactamente $1$ unidad, por lo que cada camino es disjunto, y cada camino lleva exactamente una unidad de flujo desde $s$ hasta $t$. 

Por lo que tenemos exactamente $F_max$ caminos disjuntos.

= d.

Sea $N=(V,K)$ nuestra red, como todas las aristas tienen capacidad 1, tenemos a lo sumo $F_max$ caminos de aumento, y como BFS es $O(m)$ entonces tenemos que EK es $O(m F_max)$.