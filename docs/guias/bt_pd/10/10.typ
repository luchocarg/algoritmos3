#image("image.png")
#line(length: 100%)
#image("image-1.png")
$checkmark$
#line(length: 100%)
#image("image-2.png")
$
"PC"_(w s) (i, "acc") = cases(
  0 &"si" i<1,
  "PC"_(w s) (i-1, "acc") &"si" i >= 1 and s_i < "acc",
  max{"PC"_(w s) (i-1, "acc"), 1+"PC"_(w s) (i-1, "acc"+w_i)} &"si" i>=1 and s_i >= "acc"
)  
$

Recorremos "de adelante para atrás"

El caso base no suma nada, es solo para definir un final, ya pasamos todos los $i in {1...N}$.

El primer caso recursivo define si superamos el peso que la caja $i$ puede cargar, luego, no suma nada y sigue sin tener en cuenta esa caja.

El segundo caso recursivo es el que nos suma $1$ si $i$ puede cargarlo, entonces suma $w_i$ al acumulador y continúa la recursión.


El problema se resuelve con $"PC"_(w s) (N, 0)$
#line(length: 100%)

#image("image-3.png")

== Top-down

Primero definimos $"acc"_(max) = sum_(i=1)^N w_i$, luego

```
f solve(w,s,N):- Sea $k$ el resultado, las cajas están apiladas de la forma ${i_1 ... i_k} | i_1 < ... < i_k$
- $ forall j in {1...k-1}: (sum_(t=j+1)^k w_i_t ) <= s_i_j $

  memo = matriz N*acc_max con todo -1 

  f pc(i,acc):
    if i = 0:
      ret 0
      
    if memo[i][acc] >= 0:
      ret memo[i][acc]

    if s[i] < acc:
      memo[i][acc] = pc(i-1,acc)
    if s[i] >= acc:
      memo[i][acc] = max(pc(i-1,acc), pc(i-1,acc+w[i])+1)

    return memo[i][acc]

  ret pc(N,0)
```

Su complejidad espacial y temporal están limitadas por la cantidad de estados, $O(N dot sum_(i=1)^N w_i)$

== Bottom-up

```
f solve(w,s,N):

  memo = [-1] de N*acc_max
  for acc en 0...acc_max:
    memo[0][acc] = 0 

  for i in 1...N:
    for acc in acc_max...0:

      if acc+w[i] <= acc_max:
        use = 1 + memo[i-1][acc+w[i]]

      if acc+w[i] > acc_max:
        use = 0

      memo[i][acc] = max(memo[i-1][acc], use)
```
#line(length: 100%)
#image("image-4.png")

== *Tenemos:*

$N in NN$ cantidad de cajas.

Sea $i in {1...N}$ la notación de la $i$-ésima caja, hay 2 vectores: 

$w = {w_1 ... w_N}$ donde $w_i in NN$ es el peso de la $i$-ésima caja.

$s = {s_1 ... s_N}$ donde $s_i in NN$ es el aguante de la $i$-ésima caja.

== *Nuestro objetivo es encontrar el máximo número de cajas que podemos apilar tal que:*

- Sea $k$ el resultado, las cajas están apiladas de la forma ${i_1 ... i_k} | i_1 < ... < i_k$
- $ forall j in {1...k-1}: (sum_(t=j+1)^k w_i_t ) <= s_i_j $

== *Queremos ver que $"PC"_(w s) (i,"acc")$ es correcta*
$
"PC"_(w s) (i, "acc") = cases(
  0 &"si" i<1 <- {B},
  "PC"_(w s) (i-1, "acc") &"si" i >= 1 and s_i < "acc"<- {R 1},
  max{"PC"_(w s) (i-1, "acc"), 1+"PC"_(w s) (i-1, "acc"+w_i)} &"si" i>=1 and s_i >= "acc"<- {R 2}
)  
$

Donde $i$ es la caja actual y acc es el peso acumulado de las cajas sobre $i$

== *Vamos a demostrarlo por inducción en $i$*

*Caso base: $i<1$*

Tenemos 0 cajas

$"PC"_(w s) (0, "acc") =_{B} 0$

*Paso inductivo:*

*HI:* Existe un $i=k$ tal que $"PC"_(w s) (k-1, "acc")$ es el máximo de cajas apilables hasta la $k$-ésima caja 

*Queremos ver que $forall "acc" in NN. "PC"_(w s) (k, "acc")$*

*Caso R1: $s_k < "acc"$*

Si $s_k < "acc"$ no puedo apilar las cajas acumuladas sobre $k$, por lo que no sumamos nada y seguimos a la siguiente caja.

$"PC"_(w s) (k, "acc") = "PC"_(w s) (k-1, "acc") =_"HI" V$

*Caso R2 $s_k >= "acc"$*

*subcaso 1, no apilamos $k$:*

Mantenemos el mismo número de cajas apiladas como en el caso *R1*

$"PC"_(w s) (k, "acc") = "PC"_(w s) (k-1, "acc") = "S1"$

*subcaso 2, apilamos $k$:*

Apilamos la $k$-ésima caja

$"PC"_(w s) (k, "acc") = "PC"_(w s) (k-1, "acc"+w_k) + 1 = "S2"$


*Justificación*

R2 devuelve el máximo entre S1 y S2, por HI sabemos que hasta $k−1$ teníamos el máximo acumulable, se evalúan todas las chances, para todo $k$. Luego $"PC"(k,"acc")$ computa máximo número de cajas apiladas hasta la $k$-ésima caja.

$square.big$