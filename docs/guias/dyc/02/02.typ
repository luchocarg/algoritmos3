#image("image.png")

```python
IndiceEspejo(low,high):

  Si low > high: #O(1)
    return false

  mid := (low+high)//2 #O(1)

  Si A[mid] > mid: #O(1)
    return IndiceEspejo(low, mid-1) #a= 1, b = 2

  Si A[mid] = mid: #O(1)
    return true

  Si A[mid] < mid: #O(1)
    return IndiceEspejo(mid+1, high) #a= 1, b = 2

  return false #O(1)

sol(A):
  return IndiceEspejo(1,|A|)
```

$ T(n) = T(n/2) + O(1) $

Por teorema maestro
$ underbrace(log_2 1,log_b a) = underbrace(0,c) ==> O(n^0 log n) = O(log n) | log n prec n $

