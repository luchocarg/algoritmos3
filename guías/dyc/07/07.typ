#image("image.png")

```typc
DSaux(A,low,high):
  si low ≥ high:
    return 0

  mid = (low+high)/2

  return DSaux(A, low, mid) + DSaux(A, mid+1, high) + DS(A,low,mid,high)

DS(A,low,mid,high):
  i:= low
  j:= mid+1
  

```