#image("image.png")

== Cosas útiles

Lo que queremos minimizar es para cada camino $v_1...v_k$

$ product_(i=1)^(k-1) c(v_i->v_(i+1)) $

Y sabemos que $log (x dot y) = log x + log y$, 

como el codominio es $RR_(>1)$ entonces $x < y <==> log x < log y$


Por lo que para todo par de caminos $A,B in G$ vale que:

$ log(product_(a in A) a) = sum_(a in A) log a $


$ product_(a in A) a < product_(b in B) b <==> sum_(a in A) log a < sum_(b in B) log b $


== Algoritmo 

Armamos $D'$ tal que para cada $e in E(D)$ corresponde un $e'=e, e' in E(D')$, y $c(e')= log_b c(e)$, con $b>1$ cualquiera.

Luego podemos usar Dijkstra($D',s$) $-> delta$ (vector de distancias) para cualquier nodo $s in V(D)$ y "recuperar" el peso multiplicativo de $s$ a cualquier $t in V(D)$ haciendo 

$ b^(delta(s,t)) $

== Correctitud

La equivalencia de caminos mínimos está justificada en "Cosas útiles"

La solución es correcta porque 
 $ b^(log_b (product_(a in A) a)) = product_(a in A) a $ done en nuestro caso, $a = c(v->w) "con" v->w$ en un camino $A=s->...->t$. 
 
 En otras palabras, nos devuelve $(s,v_1)times(v_1,v_2)times... times(v_k,t)$, donde $s,v_1,v_2...v_k,t$ es el camino que minimiza la suma de los logaritmos del peso de cada arista, que es equivalente al logaritmo del mínimo producto, que es lo que queríamos buscar.
