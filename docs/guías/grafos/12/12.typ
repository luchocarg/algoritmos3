#image("image.png")

(item anterior)

#image("image-1.png")


#line(length: 100%)

== Demostración

Sea $G=(V,E)$ con $|V|=n, |E| = m$

Y sabemos que $sum_(v in V) d(v) = 2m$

Inicializar un vector para cada $v in V$ es $O(|V|) = O(n)$, luego agregar cada vecino de $v$ es $O(d(v))$, pero a lo sumo hago esta operación $2m$ veces, luego agregar cada vecino de cada $v in V$ es $O(2m) in O(m)$, por lo tanto, es $O(n+m)$