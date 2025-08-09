= Árboles


== Definiciones generales

Un árbol es un grafo $G$ conexo y acíclico.

Todas las aristas de un árbol son críticas (si la eliminás del grafo, ya no es conexo).

Un nodo $v in V(G)$ es hoja $<==> "grado"(v)=1$

Un *bosque* es un conjunto de árboles, donde cada componente conexa es árbol.

*Sea $G=(V,E)$ un árbol, es equivalente decir:*

1. $G$ es árbol 
2. $G$ es acíclico, y si agregamos una arista $e in.not E$, entonces $G + e$ tendrá exactamente un ciclo, y ese ciclo contiene a $e$.
3. Existe un solo camino entre cada par de nodos $v in V$
4. $G$ es acíclico y $|E| = |V|-1$
5. $G$ es conexo y $|E| = |V|-1$


=== Lema 1:
- Sea $G=(V,E)$ un grafo conexo, $e in E$:
- $G-e$ es conexo $<==>$ $e$ existe en un ciclo de $G$

=== Lema 2:
- Todo arbol con $|V|>=2$ tiene al menos 2 hojas.

=== Lema 3:
- Si $G=(V,E)$ es árbol, entonces $|E|=|V|-1$

=== Corolario 1:
- Si $G=(V,E)$ es un bosque de $C$ componentes conexas, entonces $|E|=|V|-C$

=== Corolario 2:
- Dado $G=(V,E)$ con $C$ componentes conexas, $|E|>=|V|-C$

== Árboles enraizados

Sea $G=(V,E)$ un grafo conexo y un nodo $v in V$ al que llamaremos raiz.

Un *árbol enraizado* es un árbol $T=(V_T,E_T)$ tal que:
- $V_T subset.eq V$, $E_T subset.eq E$
- $T$ tiene raiz $v$
- Existe un nodo raiz $v in V_T$ tal que $forall w in V_T$, existe un único camino en $T$ de $v$ a $w$

Tenemos una función $"padre":(V_T \\ v) -> V_T$ tal que:

- $"padre"(w)$ es el nodo anterior a $w$ en el camino único $v ~> w$ en $T$

== Árbol generador

Sea $G=(V,E)$ un grafo conexo.

Un *árbol generador* de $G$ es un subgrafo $T = (V,E_T)$, es decir, tiene los mismos nodos que $G$ y:
- $E_T subset.eq E$ tal que $|E| >= |E_T|$
- $T$ es árbol
- $T$ tiene todos los nodos de $G$

== Árbol generador mínimo/máximo

Sea $G=(V,E)$ un grafo pesado, $c:E->RR$ una función de peso.

Un *árbol generador mínimo* (AGmin) es un árbol generador $T_min = (V,E_min)$ que minimiza el peso total de sus aristas, la idea intuitiva es que sea el peso mínimo posible tal que sea conexo y mantenga los nodos originales.

En otras palabras, es el que minimo $c(T_min) = sum_(e in E_min) c(e)$ posible entre todos los árboles generadores de $G$.

Un *árbol generador máximo* (AGMáx) es análogo al AGMin, pero maximizando.

$T_max = (V,E_max)$ tal que maximiza $c(T_max) = sum_(e in E_max) c(e)$.


== BFS

=== Input:
- Un grafo $G = (V,E)$ 
- un nodo raiz $v in V$

=== Output:
- Función de distancias $delta: V -> NN union {infinity}$ donde $delta(w)$ es la mínima cantidad de aristas entre $v$ y $w$.
- Árbol enraizado $T$ con raiz $v$, tal que todo $w in V$ es alcanzable desde $v$, y el camino $v ~> w$ en $T$ es mínimo.

=== Definición de $v$-geodésico:
- Sea $"dist"(v,w)$ la distancia mínima de $v$ a $w$ en $G$, entonces el camino $v~>w$ en el árbol generado por BFS$(G,v)$ tiene longitud $"dist"(v,w)$. 
Esto quiere decir que un árbol v-geodésico es un árbol enraizado en un nodo $v$, tal que el camino desde $v$ a cualquier vértice $w$ es el más corto posible en cantidad de aristas dentro del grafo original $G$.

=== Invariante:
- Si $delta(w) = k$, entonces no existe camino $v~>w$ con menos de $k$ aristas.
- Genera un árbol $v$-geodésico

=== Complejidad:
- Temporal: $O(|V|+|E|)$
- Espacial: $O(|V|)$

=== Usos:
- Ver si $G$ es conexo: $G$ es conexo $<==>$ BFS$(G,v)$ visita todos los nodos de $V$
- Construir árboles $v$-geodésicos. $delta(u) = delta("padre"(u))+1$
- Calcular el diámetro de un árbol:
- - BFS$(G,u) ->$ ver el nodo $v$ más lejano.
- - BFS$(G,v) ->$ ver el nodo $w$ más lejano.
- - $"dist"(v,w)$ es el diámetro. Esto es $O(|V|)$

== Dijkstra

Sea $G=(V,E)$ un grafo con *pesos positivos* en las aristas.

Dijkstra encuenta los caminos mínimos de un nodo raiz $v in V$ a todo nodo $w in V$

$"dist"(v,w) = infinity <==>$ $w$ es inalcanzable para $v$.

=== Input:
- $G=(V,E)$ un grafo.
- una función de peso $c: E -> RR_(>=0)$
- Un nodo raiz $v in V$

=== Output:
- $forall w in V$, la distancia mínima $"dist"(w)$ desde $v$ hasta $w$, o sea, $"dist"(w) = delta(v,w)$ el peso mínimo del camino $v~>w$.
- Un árbol de caminos mínimos definido por una función $"padre"$ que nos permite reconstruir los caminos mínimos.

=== Invariante:
- Sea $S$ el conjunto de nodos ya extraidos y la raiz $v in V$, en cada iteración vale $forall w in S: "dist"(w)=delta(v,w)$, donde $delta(v,w)$ es la distancia mínima de $v$ a $w$ en $G$. 
- Además sabemos que $forall u in V \\ S: "dist"(u) >= delta(v,u)$ 

=== Complejidad
- Con heap binario: $O((|V|+|E|) log |V|)$
- Con Fibonacci heap: $O(|E|+|V| log |V|)$
- Con cola no ordenada: $O(|V|^2)$

=== Usos:
- Al igual que BFS, genera un árbol $v$-geodésico.
- _st_-eficiencia:
- - Dijkstra$(G,s) -> delta_s$
- - Invertimos toda $(u,w) in E$ tal que quedan $(w,u) in E$
- - Dijkstra$(G,t) -> delta_t$ (esto nos da los caminos mínimos de todos a $t$)
- - Re-invertimos las aristas para recuperar cada $(u,w) in E$
- - Vale $delta(s,t) = delta(s,u) + c(u,w) + delta(w,t) $

== Prim

=== Input:
- Un grafo $G=(V,E)$ no dirigido con pesos positivos.
- Un nodo raiz $v in V$

=== Output:
- Un árbol generador mínimo $T=(V,E_T) subset.eq G$

=== Invariante:
- En cada iteración, $T$ es un subárbol conexo y mínimo entre todos los $w in V_T$
- La arista elegida para expandir $T$ es la de menor peso saliente del nodo actual.

=== Complejidad:
- Con heap binario: $O(|E| log |V|)$
- Con Fibonacci heap: $O(|E|+|V| log |V|)$

=== Usos:
- Obtener un árbol generador mínimo
- Obtener un árbol generador máximo, tal que dado $G=(V,E), v in V$:
- - $forall e in E:: c(e) = -c(e)$ invertimos los pesos.
- - Prim$(G,v) -> T=(V,E_T)$
- - $forall e in E_T:: c(e) = -c(e)$ para recuperar los pesos originales.

== Kruskal

=== Input:
- Un grafo $G=(V,E)$ no dirigido y pesado

=== Output:
- Un *bosque* generador mínimo de $G$. $T=(V,E_T)$

=== Invariante:
- El conjunto actual de aristas forma un bosque generador mínimo.

=== Complejidad:
- Heapsort + DSU: $O(|E| log |E|)$

=== Usos:
- Dar un bosque generador mínimo de un grafo $G$.
- Dar un bosque generador máximo, misma estrategia que Prim.

== MaxiMin/MiniMax

=== MiniMax: 
Dado $G=(V,E)$ y $cal(T)(G)$ un conjunto de árboles generadores de $G$.

El MiniMax es el árbol $T in cal(T)(G)$ donde su arista más pesada es de menor peso posible. Es decir *Mini*-miza el *Máx*-imo.

*Importante:* *Todo árbol generador mínimo es MiniMax*

=== MaxiMin:

Misma intuición que en Minimax, con la diferencia de que MaxiMin lo que hace es *Maxi*-mizar el *Min*-imo, o sea, es el árbol $T(G)$ tal que su arista menos pesada sea lo más pesada posible.

*Importante:* *Todo árbol generador máximo es MaxiMin*

#pagebreak()

*Ejemplo:*

#grid(columns: 3)[
  *Grafo original* #image("image-1.png", height: 9cm)
][ *MiniMax*
  #image("image-2.png", height: 9cm) *Máximo: 4*
][ *MaxiMin*
  #image("image-3.png", height: 9cm) *Mínimo: 5*] 
