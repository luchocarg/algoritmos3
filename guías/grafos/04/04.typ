
= Enunciado

Un vértice $v$ de un grafo $G$ es un punto de articulación si $G without v$ tiene más componentes conexas
que G. Por otro lado, un grafo es biconexo si es conexo y no tiene puntos de articulación.

Demostrar, usando inducción en la cantidad de vértices, que todo grafo de $n$ vértices que
tiene más de $((n−1)(n−2))/2$ aristas es conexo. Opcionalmente, puede demostrar la misma
propiedad usando otras técnicas de demostración.

= Solución

Sea $G=(V,E)$ quiero ver que $|V|=n and|E| = m > ((n−1)(n−2))/2  => G$ conexo.

*Por inducción en la cantidad de nodos:*

*Hipótesis inductiva*:

$ P(n-1) : m' > ((n−2)(n−3))/2  => G' "conexo." $

*Caso base:* $ P(2): m > ((2−1)(2−2))/2 => m > 0 => n = 2 and m = 1 " por lo que es conexo." $

*Paso inductivo:* $P(n-1) => P(n)$

Tenemos $P(n): m > ((n−1)(n−2))/2$

Y $((n−1)(n−2))/2 = binom(n-1,2) < m$, y $binom(n-1,2)$ es la cantidad de aristas máxima  de $K_(n-1)$, y tenemos $n$ nodos y al menos una arista más, por lo que la única chance es que el nodo restante esté conectado por una o más aristas a $K_(n-1)$ tal que sea conexo.

Luego consideremos $G'$ tal que sacamos un nodo $v in V$ cualquiera a $G$, nos queda que $m' = m - d(v)$

Por H.I: $m' = m - d(v) > ((n−2)(n−3))/2 => G' "conexo"$

Entonces si agregamos $v$ de nuevo, $G'$ sigue siendo conexo ya que agregarle las aristas que conectaban $v$ no reduce $m$

Por lo tanto, cualquier grafo con $n$ vértices y más de $binom(n-1,2)$ aristas es conexo.


