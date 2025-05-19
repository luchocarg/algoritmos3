#image("image.png")

#image("image-1.png")

#line(length: 100%)
#image("image-2.png")

$S$ es nuestro multiconjunto
```
SumaGolosa(S):
  S' = min-heap(S)
  total = 0

  while(|S'| > 1):
    x = S'.extract()
    y = S'.extract()

    S'.insert(x+y)
    total+= x+y

  return total
```

*Invariante:* En el $k$-ésimo paso, nuestra solución $G$ toma los elementos minimos $x,y in S$, hacemos:

$ S-{x,y} and_L S union (x+y) " y " G_k = x+y + G_(k-1)$

#line(length: 100%)
#image("image-3.png")

== Precondiciones:

$S={s_1,...,s_n}$ el multiconjunto de entrada, $s_i in NN$

$S_k = S_(k-1) - {x,y} union {(x+y)}$, con $x,y "los minimos" in S_(k-1)$ (o sea, los elementos que podemos usar en la $k$-ésima iteración).

$G$ es nuestra solución greedy

El costo greedy $C$ hasta el paso $k$: $C_k = x+y+C_(k-1)$, con $x,y in S_k$, con $C_0 = C_1 = 0$

$O$ una solución óptima cualquiera

== Usaremos inducción fuerte sobre $k$:

=== Caso base $k=2$:

Luego $S_2 = {x,y} => C_2 = x+y+C_1 = x+y$ hay una sola suma válida y trivialmente es igual a la óptima $O$.

=== Paso recursivo $k>2$:

*H.I.:* $forall j<k::C_j$ es el costo mínimo hasta el $j$-ésimo paso.

$G_k$ toma los mínimos $x,y in S_(k-1)$ tal que $C_k = x+y+C_(k-1)$

*Caso 1:* Si $O_k$ toma $x,y$ y por HI $C_(k-1)$ es óptimo, luego $C_(k)$ es igual de óptimo que $O_k$

*Caso 2:* Si $O_k$ toma $v,w in S_k$ con $v+w != x+y$, dado que $x,y$ son mínimos en $S_k$, entonces sabemos que $x+y<=v+w$, luego:

Si en lugar de tomar $v+w$ tomase $x+y$, entonces el costo $C'_k$ de $O_k$ sería 

$ C'_k = x+y+C'_(k-1)<=v+w+C'_(k-1) $

Por lo que el costo de $C'_k$ es óptimo y $v or w$ quedan disponibles para elegirse posteriormente.


#line(length: 100%)
#image("image-4.png")

```java
public static int sg(List<Integer> S) {
    PriorityQueue<Integer> heap = new PriorityQueue<>(S);
    int x,y;
    int total = 0;

    while(heap.size() > 1) {
        x = heap.poll();
        y = heap.poll();
        
        heap.offer(x+y);
        total += x+y;
    }

    return total;
}
```