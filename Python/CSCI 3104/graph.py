
class Graph:

    def __init__(self, adjacency_matrix):
        """ 
        Graph initialized with a weighted adjacency matrix 
        
        Attributes
        ----------
        adjacency_matrix : 2D array
            non-negative integers where adjacency_matrix[i][j] is the weight of the edge i to j,
            with 0 representing no edge

        """

        self.adjacency_matrix = adjacency_matrix

        # Add more class variables below as needed, such as n:
        self.N = len(self.adjacency_matrix)
        self.Q = dict([(0, 0)])
        for i in range(1, self.N):
            self.Q[i] = float('inf')

    def Prim(self):
        """
        Use Prim-Jarnik's algorithm to find the length of the minimum spanning tree starting from node 0

        Returns
        -------
        int
            Weighted length of tree

        """
        total = 0
        for i in range(self.N):
            node = min(self.Q, key=self.Q.get)
            total += self.Q[node]
            self.Q.pop(node)
            for j in range(len(self.adjacency_matrix[i])):
                dist = self.adjacency_matrix[i][j]
                if j != i and j in self.Q and dist < self.Q[j]:
                    self.Q[j] = dist
        return total



#  Example use case:

# G = Graph([[0, 10, 11, 33, 60],
#            [10, 0, 22, 14, 57],
#            [11, 22, 0, 11, 17],
#            [33, 14, 11, 0, 9],
#            [60, 57, 17, 9, 0]])
#
# print(G.Prim())