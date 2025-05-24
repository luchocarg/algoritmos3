#image("image.png")

```python
PotenciaLogaritmica(a,b):

  si b = 0: #O(1)
    return 1
  
  si b = 1: #O(1)
    return a

  mid = PotenciaLogaritmica(a, b/2) #en T(n), a=1, b=2

  si b par: #O(1)
    return mid*mid

  si b impar: #O(1)
    return a*(mid*mid)
```

$ T(n) = T(n/2)+O(1) $

Por teorema maestro: $ underbrace(log_2 1,log_b a) = underbrace(0,c) ==> Theta(n^0 log n) = Theta(log n) $