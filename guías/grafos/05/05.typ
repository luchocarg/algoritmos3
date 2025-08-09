= Enunciado

Sean $P$ y $Q$ dos caminos distintos de un grafo $G$ que unen un vértice $v$ con otro $w$. Demostrar
en forma directa que $G$ tiene un ciclo cuyas aristas pertenecen a $P$ o $Q$. Ayuda: denotar $P = v_0, ... , v_p $ y $Q = w_0, ... , w_q$ con $v_0 = w_0 = v$ y $v_p = w_q = w$. Definir explícitamente cuáles son
los subcaminos de $P$ y $Q$ cuya unión forman un ciclo.

= Solución

*Hipótesis:*

- $P = v_0, ... , v_p$ 
- $Q = w_0, ... , w_q$
- $v_0 = w_0 = v$ 
- $v_p = w_q = w$

Vamos a obviar todos los demás caminos de $v$ a $w$ distintos de $P$ y $Q$, luego, tenemos 2 opciones, o bien $P$ y $Q$ solo comparten $v$ y $w$, o bien comparten uno o más nodos diferentes a $v,w$. 

*Nota:* Dado que $P!=Q$ luego no pueden compartir todos sus nodos, entonces descartamos esa opción

== Caso 1 

*Hipótesis:* $exists.not u in V(G), u!=v!=w$ tal que $u in P and u in Q$

Hay de hecho un único ciclo y es trivialmente

$ P union Q = v, v_1, ... ,v_(p-1), w, w_(p-1), ... ,w_1, v $

Luego el ciclo formado tiene todas las aristas de $P$ y $Q$, y es trivialmente el único en este caso.

== Caso 2 

*Hipótesis:* $exists u in V(G), u!=v!=w$ tal que $u in P and u in Q$

Tenemos:

$ P = v,v_1, ...,u ,... , v_(p-1),w $
$ Q = v,w_1, ...,u ,... , w_(p-1),w $

En este caso, notamos que tenemos 4 subcaminos tal que 

$ P' = v,v_1, ...,u  and Q' = v,w_1, ...,u $
$ P'' = u ,... , v_(p-1),w  and Q'' = u ,... , w_(p-1),w $

Luego 

$ P' union Q' =  v,v_1, ...,u, ..., w_1, v $
$ P'' union Q'' =  w,v_(p-1), ...,u ,... , w_(p-1),w $

Tenemos 2 ciclos! Y esto vale para cualquier $u$ que cumpla la hipótesis.