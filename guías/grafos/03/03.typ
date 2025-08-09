#import emoji: face

= Enunciado
Un grafo orientado es un digrafo D tal que al menos uno de $v → w$ y $w → v$ no es
una arista de $D$, para todo $v, w ∈ V (D)$. En otras palabras, un grafo orientado se obtiene a partir de un grafo no orientado dando una dirección a cada arista. Demostrar en forma constructiva que para cada $n$ existe un único grafo orientado cuyos vértices tienen todos grados de salida distintos.

Ayuda: aprovechar el ejercicio anterior y observar que el absurdo no se produce para un único
grafo orientado.

= Solución 
Definimos grafo orientado como $D | v-> w in E(D) xor w-> v in E(D) $

Y quiero probar que $ forall G=(V,E), |V|=n, |E|=m: exists! D = arrow(G) :: exists.not u,v in V | d_"out" (u) = d_"out" (v)$ 

Esto se puede demostrar por construcción. 

Queremos armar $arrow(G)$ a partir de $G$ tal que todos sus nodos tengan grado de salida distinto y ver que solo esa solución es posible.

Entonces tenemos $V = {v_1, dots v_n}$ y le damos orientación tal que no hay aristas bidireccionales

$ d_"out" (v_1) = 0,\ d_"out" (v_2) = 1,\ dots ,\ d_"out" (v_(n-1)) = n-2,\ d_"out" (v_n) = n-1 $

Ver que no existe otra asignación es trivial, cada nodo puede estar conectado a $n-1$ nodos máximo y $0$ nodos mínimo.

*Nota:* este etiquetado es arbitrario, esto vale para cualquier $G'$ isomorfo a $G$

Del proceso anterior tenemos también que:

$ sum_(i=1)^n d_"out" (v_i) = sum_(i=0)^(n-1) i = ((n-1)(n-1+1))/2 = n(n-1)/2 $


Esto nos indica que es un *grafo completo*, o sea, de $n(n-1)/2$ aristas (en este caso dirigidas, pero vale ya que no hay bidireccionales).

Esto nos dice que existe un único $D = arrow(G)$ tal que todos los vértices tienen grado de salida distintos, y en particular, es $K_n$. $face$