#image("image.png")

Entra $N=(V,E)$

- Armamos el grafo residual con el $R=(N,f)$ con $F_max$ el máximo fijo, es $O(m)$
- DFS desde la fuente en $R$, guardando en un corte $S$, es $O(n+m)$
- Guardo todo nodo en $T |T = V\\S$, es $O(n+m)$
- Devolvemos el corte $S T$, es $O(m)$


$O(m + n + m + n + m + m) in O(n+m)$

*Nota*: estamos usando que $F_max = c(S T)$ con $S T$ un corte mínimo, nos alcanza con limitar el flujo de las aristas de $S T$ tal que sumen a lo sumo $F_max$ durante la construcción de la red residual.