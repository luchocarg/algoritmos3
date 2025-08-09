#image("image-1.png")

Los nodos serán $(x_i,y_i,v_i)$ tal que $x,y$ es la posición en la grilla, $v_i in [0,k), k in NN$ es el valor actual.

Suponiendo que $z_(i,j)$ es el valor asociado a su respectiva posición $(x_i,y_j)$ en la grilla.

Las aristas son no pesadas, con nodos $(x_i,y_i,v_i)$ hacia $(x_(i+1),y_i,(v_i+z) mod k)$ y $(x_i,y_(i+1),(v_i+z) mod k)$ con $x<=n, y<=m$ (si se va de rango no hay arista)

Para la complejidad, es la misma que en el primer taller, tenemos $2m n -m - n$ chances de ir vertical u horizontal, y $n m $ casillas en total, por lo que esto es $O(n m)$. Nosotros le agregamos además un parámetro $k$ que en el peor caso nos suma $k$ nodos por cada $x,y$, por lo que es $O(k n m)$.

El problema se resuelve haciendo BFS desde $x_1,y_1$, devolviendo un vector de padres. Luego se itera sobre el vector de padres buscando uno con valor congruente a 0 módulo $k$, y desde ese reconstruimos hasta $v$ usando el vector de padres.