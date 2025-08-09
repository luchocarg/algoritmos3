
def floydWarshall(dist):
    V = len(dist)
    for k in range(V):

        for i in range(V):
            for j in range(V):
                if(dist[i][k] != 100000000 and dist[k][j]!= 100000000):
                    dist[i][j] = min(dist[i][j],dist[i][k] + dist[k][j]);

if __name__ == "__main__":
    
    INF = 100000000
    dist = [
        [0, 7, 2, 3, 8],
        [7, 0, INF, INF, 1],
        [2, INF, 0, INF, 6],
        [3, INF, INF, 0, 5],
        [8, 1, 6, 5, 0]
    ]
    
    floydWarshall(dist)
    for i in range(len(dist)):
        for j in range(len(dist)):
            print(dist[i][j], end=" ")
        print()
