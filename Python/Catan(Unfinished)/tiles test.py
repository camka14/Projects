from vertices import *
from math import *
from random import *
def make_tile(x,y,dx,dy):
    global dict_of_tiles,count,names
    count += 1
    x += dx
    y += dy
    x = int(round(x,0))
    y = int(round(y,0))
    dict_of_tiles["tile%s"% count] = [x,y]
    return x,y
dict_of_tiles = {}
tile_neighbors = {}
count = 0
x = xi
y = yi-dy1/2
list_of_dx_dy = [[dx1*2,dx2],[dx1,dy1+dy2],[-dx1,dy1+dy2],[-dx1*2,dx2],[-dx1,-dy1-dy2],[dx1,-dy1-dy2]]

for dxdy in list_of_dx_dy:
    for i in range(0, 2):
        x,y = make_tile(x, y, dxdy[0], dxdy[1])
x += dx1
y += dy1+dy2
for dxdy in list_of_dx_dy:
    x,y = make_tile(x, y, dxdy[0], dxdy[1])
x,y = make_tile(x, y, dx1, dy1+dy2)

for vertex in dict_of_vertices:
    vert = dict_of_vertices[vertex]
    for tile in dict_of_tiles:
        ti = dict_of_tiles[tile]
        distance = math.hypot(vert[0] - ti[0], vert[1] - ti[1])
        if distance <= dy2+1:
            vertice_neighbors[vertex].append(tile)

for tile1 in dict_of_tiles:
    tile1xy = dict_of_tiles[tile1]
    tile_neighbors[tile1] = []
    for tile2 in dict_of_tiles:
        if tile1 == tile2:
            continue
        else:
            tile2xy = dict_of_tiles[tile2]
            distance = math.hypot(tile1xy[0] - tile2xy[0], tile1xy[1] - tile2xy[1])
            if distance <= dx1*2:
                tile_neighbors[tile1].append(tile2)

restart = True

while restart:
    tile_number = [2,3,3,4,4,5,5,6,6,8,8,9,9,10,10,11,11,12]
    tile_resource = ["wood","wood","wood","wood","wheat","wheat","wheat","wheat","wool","wool","wool","wool","ore","ore","ore","clay","clay","clay","sand"]
    tile_rn = {}
    restart = False
    for tile1 in dict_of_tiles:
        r = tile_resource.pop(randint(0,len(tile_resource)-1))
        if r == "sand":
            n = 0
        else:
            n = tile_number.pop(randint(0,len(tile_number)-1))
            tile_rn[tile1] = [r,n]
            if tile_rn[tile1][1] == 8 or tile_rn[tile1][1] == 6:
                for tile2 in tile_neighbors[tile1]:
                    try:
                        if tile_rn[tile2][1] == 8 or tile_rn[tile2][1] == 6:
                            restart = True
                    except:
                        pass
print(tile_rn)
