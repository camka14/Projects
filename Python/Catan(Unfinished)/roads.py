from vertices import *

dict_of_roads = {}
road_neighbors = {}
road_direction = {}
count = 0
"""looping through all the keys in dict_of_vertices and storing their xy coordinates"""

for vert1 in dict_of_vertices:
    vert1xy = dict_of_vertices[vert1]
    for vert2 in dict_of_vertices:

        """repeating the same process from before, but instead of storing the xy coordinates right away
        the program first checks if the second vertex is a neighbor to the first vertex"""

        if vert2 in vertice_neighbors[vert1]:
            vert2xy = dict_of_vertices[vert2]

            """calculating the midpoint requires finding the distance between two points dividing by two then adding them
            to the subtrahend which in this case is the vert2xy. The subtrahend is the part that subtracts in the equation"""

            new_x = (vert1xy[0]-vert2xy[0])/2+vert2xy[0]
            new_y = (vert1xy[1]-vert2xy[1])/2+vert2xy[1]
            count += 1
            road = "road%s" % (count)

            """checks to see if the new road has been inputed already"""

            if [new_x,new_y] in dict_of_roads.values():
                continue

            if vert1xy[0]-vert2xy[0] < 0 and vert1xy[1]-vert2xy[1] < 0:
                road_direction[road] = 'UL'
            elif vert1xy[0]-vert2xy[0] > 0 and vert1xy[1]-vert2xy[1] < 0:
                road_direction[road] = 'UR'
            elif vert1xy[0]-vert2xy[0] < 0 and vert1xy[1]-vert2xy[1] > 0:
                road_direction[road] = 'UR'
            elif vert1xy[0]-vert2xy[0] > 0 and vert1xy[1]-vert2xy[1] > 0:
                road_direction[road] = 'UL'
            else:
                road_direction[road] = 'UP'
            """adding a new road to dict_of_roads and vertice_neighbors. Also adding the vertices to road_neighbors"""

            dict_of_roads[road] = [new_x,new_y]
            road_neighbors[road] = [vert1,vert2]
            vertice_neighbors[vert1].append(road)
            vertice_neighbors[vert2].append(road)

#print (dict_of_roads)
#Bprint (road_neighbors)
#print (vertice_neighbors)
