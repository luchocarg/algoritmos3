#image("image.png")

#line(length: 100%)


#image("image-1.png")

== Algoritmo

```
SumaSelectiva(X):
  X' = sort(X)

  res = 0
  n = |X'|

  for i: n-k...n:
    res+= X'[i]

  return res
```

*Invariante:* En la $i$-ésima iteración, `res` es la suma de los $i-(n-k)$ elementos más grandes de $X'$

== Demostración de optimalidad

Tenemos que $X'$ es nuestro conjunto $X$ ordenado de forma creciente tal que $forall i<j:: X'_i < X'_j$, o sea, los $k$ elementos más grandes son los últimos $k$, tal que nuestro algoritmo greedy $G$ computa: 

$G= sum_(i=n-k)^n X'_i $


Y sea $O$ una solución óptima, $O<= G$ dado que $G$ suma los $k$ elementos más grandes, pero si $O$ es óptima también lo hace, entonces $O=G$


#line(length: 100%)

#image("image-2.png")

```java
public static int ssnlogn(List<Integer> X, int k) {
    int n = X.size();
    X.sort(null); //Es TimSort, O(nlogn)

    int res = 0;
    for (int i = n-k ;i<n ;i++) { //O(n)
        res+= X.get(i);
    }
    return res;
}
```

#line(length: 100%)

#image("image-3.png")
```java
public static int ssnlogk(List<Integer> X, int k) {
  int n = X.size();
  PriorityQueue<Integer> heap = new PriorityQueue<>();

  for (int x : X) { //O(n)
      heap.offer(x); //O(logk)
      if (heap.size() > k) heap.poll(); //O(logk)
  }

  int res = 0;
  while(!heap.isEmpty()) res+= heap.poll(); //O(logk)

  return res;
}
```

Acá no dejamos que el heap sea más grande que $k$, por eso las operaciones quedan $O(log k)$

