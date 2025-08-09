= Enunciado

Sea $G$ un grafo conexo. Demostrar por el contrarrecíproco que todo par de caminos simples
de longitud máxima de $G$ tienen un vértice en común.

*Ayuda:* suponer que hay dos caminos
disjuntos en vértices de igual longitud y definir explícitamente un camino que sea más largo que ellos.

= Solución

*Proposición:* Sean $P,Q$ caminos simples en $G$, 

$ G "conexo" => forall P,Q "de longitud máxima" :: exists v in V | v in P and v in Q $

*Contrarrecíproco:*

$ exists P,Q "de longitud máxima" | forall v in V, v in.not P or v in.not Q => G "no es conexo" $

*Hipótesis:* Asumimos que existen $P,Q$ ambos de longitud máxima donde no existe ningún nodo $v in V$ en común entre $P$ y $Q$.

Queremos ver que $G$ no es conexo.

Tenemos $|P|=|Q|=n$ donde $n$ es la cantidad de nodos de $P,Q$.

Vamos a notar $P = v_1, ... , v_n$, $Q = w_1, ... , w_n$

$G$ es conexo, por lo que se puede llegar desde cualquier nodo $v$ a cualquier nodo $w$ y viceversa.

Esto también nos dice en particular que hay algún camino $R= v_i, ... , w_i$ donde $R$ no pasa por ningún otro nodo de $P$ o $Q$ distintos de $v_i, w_i$.

Por hipótesis, $P,Q$ son disjuntos, entonces $v_i != w_i$ por lo que existe al menos un nodo $u$ tal que $R = v_i, ..., u,..., w_i$, y habíamos dicho que puedo llegar de cualquier nodo a cualquier nodo dado que $G$ conexo!

Tenemos por ahora: $P = v_1, ... ,v_i ,...,v_n and Q = w_1, ... ,w_i ,...,w_n$

Tomamos $P'= v_1,...,v_i and Q'= w_i,...,w_n$ como los subcaminos más largos de $P,Q$. (Análogo para casos contrarios)

Ahora tenemos un camino $R'= v_1,...,v_i, ..., u,..., w_i,...,w_n$ y esto es de longitud al menos $n+1$, *contradicción*, por lo que la hipótesis es falsa $P,Q$ no son de longitud máxima! luego la proposición es verdadera.