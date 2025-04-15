'''
import math

def min_prec(t1: tuple[int, int], t2: tuple[int, int]):
    a1,b1 = t1
    a2,b2 = t2

    if a1 > a2: return (a1,b1)
    if a1 < a2: return (a2,b2)
    if a1 == a2:
        if b1 > b2: return (a1,b1)
        else: return (a2,b2)

def cq(B,c,c_prime,q_prime):
    return

def cc(B,c):
    if c <= 0:
        return (0,0)
    if len(B) == 0 and c > 0:
        return (math.inf, math.inf)
    if c > 0 and len(B) != 0:
        c_prime,q_prime = cq
        min_prec(max(0,c_prime,))
'''