#image("image.png")

= a

*Modelado*

Definimos un digrafo $D=(V,E)$

A cada cabina $i$ la definimos como un  $v_i in V$

A cada "ruta" $i->j$ le damos una arista, $(i,j) in E$, con costo $w(i,j) = c_( i j) + c_i$

= b
*Algoritmo*


```
//Armamos con el conjunto E una matriz de adyacencia M
M de |V|*|V| inicializada en todo inf

Para cada (i,j) in E:
  M[i][j] = w(i,j)

//Bellman-Ford tal que devuelve si existen ciclos negativos.
hay_puré <- Bellman-Ford(M)

//Devuelve True si hay ciclos negativos, False si no.
return hay_puré

```

#image("image-1.png")

= c

Creamos un digrafo $D=(V,E)$

Cada cabina $i$ se representa con 2 nodos indicando el estado anterior:


