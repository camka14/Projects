import math
dict_of_vertices = {}

"""creates and stores all the vertices"""

def make_vertice(x,y,dx,dy):
    global dict_of_vertices,count
    count+=1
    x+=dx #changes x by dx
    y+=dy #changes y by dy
    x = int(round(x,0)) #rounds x to the ones place
    y = int(round(y,0)) #rounds y to the ones place
    dict_of_vertices["vert%s"% (count)] = [x,y] #stores the coordinates into a key
    return x,y

"""place holder for aspect ratio input"""

wh = 720
ww = 1280

"""these are the distances between points that are proportional to the aspect ratio"""

dx1 = wh/12
dy1 = dx1/math.sqrt(3)
dx2 = 0
dy2 = dy1*2
xi = ww/2 - dx1*3 #initial
yi = dy1*2 #initial y
x = xi
y = yi
count = 0 #count is used for numbering the vertices

"""the list_of_dx_dy sets an order to which the change in x and y is called out, in order to get a hexagon"""

list_of_dx_dy = [[dx1,-dy1,dx1,dy1],[dx1,dy1,dx2,dy2],[dx2,dy2,-dx1,dy1],[-dx1,dy1,-dx1,-dy1],[-dx1,-dy1,dx2,-dy2],[dx2,-dy2,dx1,-dy1]]

"""these loops go through the list_of_dx_dy and use the function make_vertice to create the coordinates for each new vertice
based off the previous one"""

for dxdy in list_of_dx_dy: #outer loop of points
    for i in range(0,3):
        x,y = make_vertice(x, y, dxdy[0], dxdy[1]) #sends info to function "make_vertice"
        if i == 2:
            continue
        x,y = make_vertice(x, y, dxdy[2], dxdy[3])
x += dx1 #makes the adjustment to the right
y += dy1+dy2 #makes the adjustment downwards
for dxdy in list_of_dx_dy: #middle loop of points
    for i in range(0,2):
        x,y = make_vertice(x, y, dxdy[0], dxdy[1])
        if i == 1:
            continue
        x,y = make_vertice(x, y, dxdy[2], dxdy[3])
x += dx1 #makes the adjustment to the right
y += dy1+dy2 #makes the adjustment downwards
for dxdy in list_of_dx_dy: #center tile
    x,y = make_vertice(x, y, dxdy[0], dxdy[1])

"""finds each neighboring vertice which is a specific distance away"""

vertice_neighbors = {}
for vertex1 in dict_of_vertices:
    vertice_neighbors[vertex1] = [] #creates a new key with blank list
    for vertex2 in dict_of_vertices:
        x1y1 = dict_of_vertices[vertex1] #grabs the coordinates for vert1
        x2y2 = dict_of_vertices[vertex2] #grabs the coordinates for vert2
        distance = math.sqrt((x1y1[0]-x2y2[0])**2+(x1y1[1]-x2y2[1])**2)
        if distance <= dy2+1 and distance > 0: #checks if distance is close enough and adds one pixel because of rounding error
            vertice_neighbors[vertex1].append(vertex2)
