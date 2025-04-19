w = [0,19,7,5,6,1]
s = [0,15,13,7,8,2]
n = len(w)

def pc(i, acc):
    if i == 0:
        return 0
    
    if s[i] < acc:
        return pc(i-1,acc)
    else:
        return 1 + pc(i-1,acc+w[i])

print(pc(n-1, 0))

def solve(w, s, N):
    acc_max = sum(w[1:])
    dp = [[0] * (acc_max + 1) for _ in range(N + 1)]

    for i in range(1, N + 1):
        for acc in reversed(range(acc_max + 1)):
            if s[i] < acc:
                dp[i][acc] = dp[i - 1][acc]
            else:
                dp[i][acc] = max(dp[i - 1][acc], 1 + dp[i - 1][acc + w[i]] if acc + w[i] <= acc_max else 0)

    return dp[N][0]

print(solve(w,s,n-1))