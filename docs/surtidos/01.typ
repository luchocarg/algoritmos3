Vamos a probarlo por inducción en $n,m$

*Caso base $i<=0 or j<=0$*

Cualquier posición $A[i][j]$ está fuera del dominio, no podemos llegar yendo hacia abajo o hacia la derecha.

*Caso base $i=1 and j=1$*

Si computamos $f(1,1)$, luego el valor del camino $(1,1)->(1,1)$ es el valor de $A[i][j]= A[1][1]$

*Paso inductivo*

- *HI:* suponemos que para 

- $i'<=i<=n$,

- $j'<=j<=m$,

- $(i',j')!=(i,j)$

Luego $f(i',j')$ computa el camino mínimo desde $(1,1)$ hasta $(i',j')$

Queremos ver que $f(i,j)$ computa el camino mínimo desde $(1,1)$ hasta $(i,j)$

- *Si venimos desde la izquierda*

Por *HI* $f(i-1,j)$ es el camino mínimo desde $(1,1)$ hasta $(i-1,j)$

Luego, $A[i][j] + f(i-1,j)$ es un candidato a camino mínimo hasta $(i,j)$



- *Si venimos desde arriba*

Por *HI* $f(i,j-1)$ es el camino mínimo desde $(1,1)$ hasta $(i,j-1)$

Luego, $A[i][j] + f(i,j-1)$ es un candidato a camino mínimo hasta $(i,j)$


*Por lo tanto:*

El camino mínimo es el mínimo entre $A[i][j] + f(i-1,j)$ y $A[i][j] + f(i,j-1)$, y esto vale para todo $i<=n,j<=m$, y en particular, para $f(n,m)$

$square$