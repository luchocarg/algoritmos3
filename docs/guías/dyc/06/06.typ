#image("image.png")

Decimos que $B$ es árbol, implementado como lista de adyacencias.

```typc

B <- nuestro árbol binario
r <- raiz del árbol B

dfs(r):
    si r = Nil: //O(1)
        return (0,0)

    (izq_alt,izq_dist) = dfs(B[r][1])
    (der_alt,der_dist) = dfs(B[r][2])

    altura = 1 + máx(izq_alt,der_alt) //O(1)
    dist = máx(máx(izq_dist, der_dist), izq_alt+der_alt)) //O(1)

    return(altura, dist)

DistanciaMáxima(B, r):
    (w,res) = dfs(r) //w no representa nada

    return res
```

Esto recorre recursivamente todos los nodos una única vez, es $Theta(n)$.