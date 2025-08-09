#image("image.png")

== a.
Trivial $O(n m^2)$

== b.
El flujo máximo es $F <= n q$, y hacemos $F$ aumentos, por lo que nos queda $O(min{m^2 n, m n q})$


== c.

Si el flujo máximo $F << m n$ entonces hacemos a lo mucho $F$ aumentos, nos queda $O(min{m^2 n, m F})$ 


Tanto en el (b) como en el (c), multiplicamos por $O(m)$ ya que es el peor caso de encontrar un camino de aumento con BFS.