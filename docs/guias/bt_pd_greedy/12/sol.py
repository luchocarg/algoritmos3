import time

k = 5
n = 6
s = 15


def f(i, s):
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1
    return sum(f(i-1, s-j) for j in range(1, k+1))

def g(i, s, k):
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1
    return sum(g(i-1, s-j, j) for j in range(1, k+1))

memo_f = [[-1 for _ in range(s+1)] for _ in range(n+1)]

def f_td(i, s):
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1

    if memo_f[i][s] != -1: return memo_f[i][s]

    memo_f[i][s] = sum(f_td(i-1, s-j) for j in range(1, k+1))

    return memo_f[i][s]

memo_g = [[[-1 for _ in range(k+1)] for _ in range(s+1)] for _ in range(n+1)]

def g_td(i, s, k):
    if s < 0 or i < 0: return 0
    if s == 0 and i == 0: return 1
    if memo_g[i][s][k] != -1: return memo_g[i][s][k]
    memo_g[i][s][k] = sum(g_td(i-1, s-j, j) for j in range(1, k+1))
    return memo_g[i][s][k]

start = time.time()
print(f(n, s))
end = time.time()
print(f"f sin memo: {end - start:.5f}s")

start = time.time()
print(f_td(n, s))
end = time.time()
print(f"f con memo: {end - start:.5f}s")

start = time.time()
print(g(n, s, k))
end = time.time()
print(f"g sin memo: {end - start:.5f}s")

start = time.time()
print(g_td(n, s, k))
end = time.time()
print(f"g con memo: {end - start:.5f}s")
