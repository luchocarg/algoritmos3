#image("image.png")

Hacemos un FW tal que en cada iteración chequee:

` si d[i][j] < d[i][k]+d[k][j]: retorna False, i,k,j
`

y al final si no breakeó los loops, `ret True`, a este algoritmo lo llamaté `is_FW(M)`

Luego, para devolver un grafo $G$ con la mínima cantidad de aristas posibles alcanza con otra modificación de FW tal que:

 `si d[i][k]+d[k][j] <= d[i][j] and k!=i!=j: M[i][j] = 0 `