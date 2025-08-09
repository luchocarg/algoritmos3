#image("image.png")

$checkmark$
#line(length: 100%)

#image("image-1.png")

Para $C={1,1,1}, n=|C|, k=1$

#image("b.svg")
#line(length: 100%)

#image("image-2.png")

$checkmark$
#line(length: 100%)

#image("image-3.png")

1.f. es $O(2^(|C|)) = O(2^n)$

Luego, tenemos una matriz de tamaño $n dot k$, entonces es de a lo sumo $O(n dot k)$

Si $k << 2^n => O(n dot k)$ es mejor $"ss"'$
b
#image("image-5.png")
$checkmark$
#line(length: 100%)

#image("image-6.png")

```



memo = [0...k] en False
memo[0] = True

para c in C
  para j in k...c
    si memo[j-c] = True: memo[j] = True

ret memo[k]

```

#line(length: 100%)

#image("image-7.png")

= Inducción en $i$
Sea $i in {0...n},j in {0...k}$

$P(i): exists s subset.eq {c_1,...,c_i} | sum s = j <==> "ss'"_C (i,j) = V$

== Caso base:

$P(0): exists s subset.eq {c_1,...,c_0} | sum s = j <==> "ss'"_C (0,j) = V$

$(==>)$

Hipótesis: $exists s subset.eq {c_1,...,c_0} | sum s = j ==> s=emptyset and j=0$

Luego, $"ss'"_C (0,j) = (j=0) =_"Hipotesis" V$ $checkmark$


$(<==)$

Hipótesis: $"ss'"_C (0,j) = V ==> j=0$


Luego, $exists s subset.eq {c_1,...,c_0} | sum s = j ==> s=emptyset | sum s = sum emptyset = j = 0 $ $checkmark$


== Paso inductivo:
*HI:* $P(i-1): exists s subset.eq {c_1,...,c_(i-1)} | sum s = j <==> "ss'"_C (i-1,j) = V$


Queremos probar que $forall j ::P(i-1) => P(i)$

=== Caso $i!=0 and C[i]>j$

$"ss'"_C (i,j) = "ss'"_C (i-1,j) =_"HI" V$ $checkmark$

$ &exists s subset.eq {c_1,...,c_(i-1)} | sum s = j and C[i] > j ==> \ &exists s subset.eq {c_1,...,c_(i)} | sum s = j, C[i] in.not s ==> \ &exists s subset.eq {c_1,...,c_(i)} | sum s = j$ $checkmark$

=== *Caso $C[i] <= j$*

Definición: $"ss'"_C (i,j) = "ss'"_C (i-1,j) or "ss'"_C (i-1,j-C[i])$

Si $"ss'"_C (i,j) = "ss'"_C (i-1,j) = V$:

Ya lo probamos antes $checkmark$

Si $"ss'"_C (i,j) = "ss'"_C (i-1,j-C[i]) = V$:

$C[i]<=j and_"HI" exists s subset.eq {c_1,...,c_(i-1)} | sum s = j ==> 0<=j-C[i]<=k$

Alcanza con probar que 

$exists s' subset.eq {c_1,...,c_(i-1)} | sum s' = j-C[i] ==> exists s=s' union {c_i}subset.eq {c_1,...,c_i} | sum s = j$

Vemos que trivialmente $s'subset.eq {c_1,...,c_(i-1)} => s=s' union {c_i}subset.eq {c_1,...,c_i}$

Y $sum s' = j-C[i] => sum s' union {c_i} = j-C[i]+C[i] = j $ $checkmark$

$square$