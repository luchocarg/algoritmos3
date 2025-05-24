#image("image.png")

Precondición: $|X_i|=k$, $X$ será mi lista donde $X[i]$ es $X_i$

$d(X,Y)) = sum _(i=1)^k |x_i-y_i|$ con $X={x_1...x_k}, Y={y_1...y_k}$

Y sea $c: E(G) -> RR$ una función de costo de cada arista (la que usa prim/kruskal)

== Algoritmo

```
Algoritmo(X,n,k):
    //Grafo vacio
    G <- lista de adyacencias de tamaño n (n nodos sin aristas)

    //Armado del grafo
    Para cada i en 1...n:
        Para cada j en (i+1)...n:
            G[i].agregar(j)
            G[j].agregar(i)
            c(i,j) <- d(X[i],X[j])

    //Generación del AGM
    return Prim(G)
```

== Justificación de complejidad

El armado del grafo vacio es generar una lista de $n$ listas vacias, es $O(n)$

Luego tenemos que agregar una arista a una lista de adyacencia es $O(1)$

Calcular $d(X,Y)$ es sumar cada $x_i,y_i$, $k$ veces, esto es $O(k)$, y está dentro de 2 loops anidados, más abajo probarmos que la complejidad total de este loop es $O(k n^2)$.

Finalmente, sabemos que Prim devuelve un AGM asociado a un grafo $G$, y Prim es $O(m+n log n)$ (nótese que acá $m approx n^2$ por lo que Prim es la mejor opción, aunque no va al caso)

Entonces nos queda $O(n + k n^2 + m+n log n) in O(k n^2)$

== Complejidad de la construcción del grafo:
$ 
sum_(i=1)^(n-1) sum_(j=i+1)^n O(k) + O(1) + O(1) = 
sum_(i=1)^(n-1) sum_(j=i+1)^n O(k) = 
O(k) times sum_(i=1)^(n-1) sum_(j=i+1)^n 1 = \
O(k) times sum_(i=1)^(n-1) n-i = 
O(k) times (sum_(i=1)^(n-1) n - sum_(i=1)^(n-1) i) = 
O(k) times (n sum_(i=1)^(n-1) 1 - sum_(i=1)^(n-1) i) = \
O(k) times (n(n-1) - sum_(i=1)^(n-1) i) = 
O(k) times (n(n-1) - n(n-1)/2) = \
O(k) times (n(n-1)/2) = 
O(k) times (n^2-n)/2 in O(k.n^2)
$