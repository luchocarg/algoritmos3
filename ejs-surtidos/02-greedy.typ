#image("image-3.png")

$X = {x_1...x_n}$, y tenemos un $k<=n$

maximo subconjunto $S$ de $X$ de tamaño $k$

$X = {1,23,3,56,2,6}$, $k=4$

$S = {56,23,6,3}$

#image("image-4.png")


```
Algoritmo(X,k):
  X' <- sort(X) tal que ordena de mayor a menor

  res = 0

  para todo i: 1...k:
    res+= X'[i]

  return res

```

*Invariante:* la suma de los $k$ elementos más grandes hasta la k-esima iteración


Tenemos un conjunto $X'$ que es el conjunto $X$, ordenado de forma decreciente. $forall i<j :: X'_i > X'_j$

Entonces los $k$ primeros elementos son los mas grandes por el invariante. y la solución greedy $G$ nos dice que:
$G = sum_(i=1) ^k X'_i $


Tenemos una solucion optima $O$ y sabemos que $O<=G$ porque por invariante, $G$ tiene los $k$ elementos más grandes.

Pero $O$ no puede ser peor que $G$ porque $O$ es optima, luego $O$ no es menor a $G$, por lo que $O$ es igual de optima que $G$
