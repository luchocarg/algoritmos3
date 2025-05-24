#image("image.png")

Todos los demás no se pueden calcular con el teorema maestro.

== 6

$ T(n) = T(n/2) + n $

$ underbrace(log_2 1,log_b a) = 0 < underbrace(1,c) ==> T(n) = Theta(n) $

== 7

$ T(n) = T(n/2) + sqrt(n) $

$ underbrace(log_2 1,log_b a) = 0 < underbrace(0.5,c) ==> T(n) = Theta(sqrt(n)) $

== 8

$ T(n) = T(n/2) + n^2 $

$ underbrace(log_2 1,log_b a) = 0 < underbrace(2,c) ==> T(n) = Theta(n^2) $

== 10

$ T(n) = 2 T(n/2) + log n, "acotable por" T(n) = 2 T(n/2) + O(sqrt(n)) $

$ underbrace(log_2 2,log_b a) = 1 > underbrace(0.5,c) ==> T(n) = Theta(n) $

== 12

$ T(n) = 3 T(n/4) + n $

$ underbrace(log_4 3,log_b a) < underbrace(1,c) ==> T(n) = Theta(n) $