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

$ S-{x,y} and_L S union (x+y) " y " G_k = x+y +  sum_(i<k) G_i $

#line(length: 100%)
#image("image-3.png")

*Invariante:* en la $k$-ésima iteración, $x,y in S_k$ son reemplazados por $x+y$ y la suma acumulada es:

$ G_k = x+y+ sum_(i<k) G_i $

Y sea $O$ una solución óptima cualquiera.

*Por inducción fuerte sobre la cantidad de combinaciones parciales:*

*Caso base $k = 1$*

Tenemos solo 2 elementos, por ende son los mínimos, y la suma acumulada es $x+y$. Trivialmente $G=O$

*Paso recursivo $k-1 => k$*

*H.I:* Suponemos que $forall k-1>=i:: G_i$ son soluciones óptimas, con $p<n$ elementos en $S_k$

Queremos ver que si intercambiamos $o_k$ por $g_k$ en $O$, sigue siendo óptima.

Recordemos:

$ G_k = x+y +  sum_(i<k) G_i , "con" x,y "los minimos de" S_k $

y por *H.I.* $G$ es tan buena como $O$ hasta el $k-1$-ésimo paso, por lo tanto en el paso $k$ tenemos:

$ x+y+sum_(i<k) G_i <= v+w+sum_(i<k) G_i $ donde $O$ toma $v,w in S_k^O$ y $G$ toma $x,y in S_k^G$

Esto se reduce a $x+y<=v+w$, entonces $G_k$ es al menos tan buena como $O_k$
$==>$ $G$ es óptima.


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