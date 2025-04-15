#image("image.png")
#image("image-1.png")

Defino $prec$ como el orden $c',q'$ tal que $min_prec$ implica ver primero el mínimo valor $c'$ y luego, el mínimo $q'$ para "desempatar"

$ "cc"(B,c)= cases(
  (0,0) "si" c <= 0,
  (infinity, infinity) "si" B=emptyset and c > 0,
  min_prec {(max(0,c'+b_n-c),q'+1),"cc"(B-{b_n},c)} "si" c>0 and B != emptyset
) $

$ (c',q') = "cc"(B-{b_n},c-b_n) $

#line(length: 100%)
#image("image-2.png")

*TO DO*

#line(length: 100%)
#image("image-3.png")
$B={b_1 ... b_n}$

$
  "cc"'_B (i,j)= cases(
  (0,0)  "si" j <= 0,
  (infinity,infinity)  "si" i=0 and j >0,
  min_prec {(max(0,c''+b_i-j),q''+1),"cc"'_B (i-1,j)}  "si" i > 0 and j > 0
  )
$
$ (c'',q'') = "cc"'_B (i-1,j-b_i) $

#line(length: 100%)
#image("image-4.png")

Definimos una matriz de tamaño $(n+1) dot (c+1)$ tal que cada posible combinación de cantidad de billetes ($0...n$) y costos ($0...c$) sea accesible en $O(1)$

La complejidad de esto es $O(n dot c)$

#line(length: 100%)

#image("image-6.png", width: 80%)

*TO DO*

#line(length: 100%)
#image("image-7.png")

$"cc"'_B (n,c)$ resuelve el problema.
