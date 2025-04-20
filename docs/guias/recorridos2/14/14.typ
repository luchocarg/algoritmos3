#image("image.png")


st-eficiente es si `d[s][t] = d[s][u]+c(u->w)+d[w][t]`

Propongo un FW modificado, tal que:

`

Precomputo FW(G) -> M, luego para M:

max_arista = None
cont_max = 0

for (v,w) in E:
  contador = 0

  for s in 1..n:
    for t in 1..n:
      if d[s][t] = d[s][v]+c(v->w)+d[w][t]:
        contador++
  
  si contador > cont_max:
    cont_max = contador
    max_arista = (v,w) 
`

Si bien es $O(m dot n^2) in O(n^4)$, no hay forma de hacerlo más eficiente, ya que buscamos para cada arista, para todo par s,t