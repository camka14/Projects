import sys
from tiles import dict_of_tiles,dict_of_vertices,tile_rn,vertice_neighbors,dx1,dy1,dy2
from roads import dict_of_roads, road_direction, road_neighbors
from roll_dice import *
from select_order import *
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow, QVBoxLayout, QLabel, QPushButton, QHBoxLayout
from PyQt5.QtGui import QIcon, QPixmap, QTransform
from PyQt5.QtCore import Qt

class Catan(QMainWindow):

    def __init__(self):
        super().__init__()
        self.title = 'Catan'
        self.left = 10
        self.top = 31
        self.width = 1280
        self.height = 720
        self.button_size = 30
        self.initUI()

    def initUI(self):
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)


        self.startbtn = QPushButton('Start Game', self)
        self.play2 = QPushButton('2 Players', self)
        self.play3 = QPushButton('3 Players', self)
        self.play4 = QPushButton('4 Players', self)

        self.startbtn.clicked.connect(lambda : self.start())
        self.play2.clicked.connect(lambda : self.player_num(self.play2.text()))
        self.play3.clicked.connect(lambda : self.player_num(self.play3.text()))
        self.play4.clicked.connect(lambda : self.player_num(self.play4.text()))

        self.startbtn.setGeometry((self.width-self.startbtn.width())/2,(self.height-self.button_size)/2,self.startbtn.width(),self.button_size)
        self.play2.setGeometry((self.width-self.play2.width())/2,(self.height)/2+self.button_size,self.play2.width(),self.button_size)
        self.play3.setGeometry((self.width-self.play3.width())/2,(self.height)/2+self.button_size*2,self.play3.width(),self.button_size)
        self.play4.setGeometry((self.width-self.play4.width())/2,(self.height)/2+self.button_size*3,self.play4.width(),self.button_size)

        self.show()

    def player_num(self,name):
        if name == '2 Players':
            self.order = select_order(2)
            self.play2.setStyleSheet('QPushButton{background: red;}')
            self.play3.setStyleSheet('')
            self.play4.setStyleSheet('')
        elif name == '3 Players':
            self.order = select_order(3)
            self.play2.setStyleSheet('')
            self.play3.setStyleSheet('QPushButton{background: red;}')
            self.play4.setStyleSheet('')
        else:
            self.order = select_order(4)
            self.play2.setStyleSheet('')
            self.play3.setStyleSheet('')
            self.play4.setStyleSheet('QPushButton{background: red;}')

    def start(self):
        self.turn = 0
        self.first_turn_a = True
        self.first_turn_b = False
        self.r = False
        self.disabled_houses =[]
        self.lumber = 19
        self.grain = 19
        self.wool = 19
        self.ore = 19
        self.brick = 19
        self.dev_cards = ['Knight']*14+['Monopoly']*2+['Build Road']*2+['Year of Plenty']*2
        self.player_houses = {}
        self.player_roads = {}
        self.players = {}
        for player in self.order:
            self.players[player] = [0,1,1,0,0,0,0,0,[],0] #cities(0), settlements available(1), roads(2), lumber(3), grain(4),
            self.player_houses[player] = []               # wool(5), ore(6), brick(7), development cards(8), cites+settlements on board(9)
            self.player_roads[player] = []
        self.next = QPushButton('Next', self)
        self.next.move(self.width*3/4,self.height*3/4)
        self.next.clicked.connect(lambda : self.next_turn())
        self.roll = QPushButton('Roll', self)
        self.roll.move(self.width*3/4, self.height*1/4)
        self.roll.clicked.connect(lambda : self.rolled())

        for name in dict_of_tiles:
            x = dict_of_tiles[name][0]+self.button_size/2
            y = dict_of_tiles[name][1]
            labeltile = QLabel(self)
            labelnumber = QLabel(self)
            if tile_rn[name][0] == 'lumber':
                tile = QPixmap('Tiles/Forest.png')
            elif tile_rn[name][0] == 'wool':
                tile = QPixmap('Tiles/Pastures.png')
            elif tile_rn[name][0] == 'grain':
                tile = QPixmap('Tiles/Fields.png')
            elif tile_rn[name][0] == 'brick':
                tile = QPixmap('Tiles/Hills.png')
            elif tile_rn[name][0] == 'ore':
                tile = QPixmap('Tiles/Mountains.png')
            else:
                tile = QPixmap('Tiles/Desert.png')

            if tile_rn[name][1] == 2:
                number = QPixmap('Numbers/2.png')
            elif tile_rn[name][1] == 3:
                number = QPixmap('Numbers/3.png')
            elif tile_rn[name][1] == 4:
                number = QPixmap('Numbers/4.png')
            elif tile_rn[name][1] == 5:
                number = QPixmap('Numbers/5.png')
            elif tile_rn[name][1] == 6:
                number = QPixmap('Numbers/6.png')
            elif tile_rn[name][1] == 8:
                number = QPixmap('Numbers/8.png')
            elif tile_rn[name][1] == 9:
                number = QPixmap('Numbers/9.png')
            elif tile_rn[name][1] == 10:
                number = QPixmap('Numbers/10.png')
            elif tile_rn[name][1] == 11:
                number = QPixmap('Numbers/11.png')
            elif tile_rn[name][1] == 12:
                number = QPixmap('Numbers/12.png')
            else:
                number = QPixmap('')

            number = number.scaledToWidth(self.button_size*2)
            tile = tile.scaledToWidth(dx1*2)
            labelnumber.setPixmap(number)
            labeltile.setPixmap(tile)
            labelnumber.setGeometry(x-self.button_size,y,number.width(),number.height())
            labeltile.setGeometry(x-dx1,y-dy2+dy1,tile.width(),tile.height())
            labelnumber.show()
            labeltile.show()
            self.next.show()
            self.roll.show()
            self.startbtn.hide()
            self.play2.hide()
            self.play3.hide()
            self.play4.hide()

        for vertex in dict_of_vertices:
            x = dict_of_vertices[vertex][0]
            y = dict_of_vertices[vertex][1]+self.button_size/2
            vert = QPushButton(vertex,self)
            vert.move(x,y)
            vert.resize(self.button_size,self.button_size)
            vert.setStyleSheet('QPushButton{background: transparent; color:transparent}')
            vert.clicked.connect(lambda ignore,vertex=vertex,x=x,y=y: self.vertclicked(vertex,x,y))
            vert.show()

        for name in dict_of_roads:
            x = dict_of_roads[name][0]
            y = dict_of_roads[name][1]+self.button_size/2+2
            road = QPushButton(self)
            road.move(x,y)
            road.resize(self.button_size,self.button_size)
            road.setStyleSheet('QPushButton{background: transparent;}')
            road.clicked.connect(lambda ignore,name=name,x=x,y=y:self.roadclicked(name,x,y))
            road.show()

    def rolled(self):
        if not self.first_turn_a and not self.first_turn_b and not self.r:
            self.r = True
            dice = roll_dice()
            number = dice[0] + dice[1]
            for player in self.players:
                for vertex in self.player_houses[player]:
                    for tile in dict_of_tiles:
                        if tile in vertice_neighbors[vertex]:
                            if tile_rn[tile][1] == number:
                                if tile_rn[tile][0] == 'lumber':
                                    self.players[player][3] += 1
                                    self.lumber -= 1
                                if tile_rn[tile][0] == 'grain':
                                    self.players[player][4] += 1
                                    self.grain -= 1
                                if tile_rn[tile][0] == 'wool':
                                    self.players[player][5] += 1
                                    self.wool -= 1
                                if tile_rn[tile][0] == 'ore':
                                    self.players[player][6] += 1
                                    self.ore -= 1
                                if tile_rn[tile][0] == 'brick':
                                    self.players[player][7] += 1
                                    self.brick -= 1
                                print (self.players)


    def next_turn(self):
        player = self.order[self.turn]
        if self.first_turn_a:
            self.players[player][1] += 1
            self.players[player][2] += 1
            self.turn += 1
            if self.turn == len(self.order):
                self.first_turn_a = False
                self.first_turn_b = True
                self.turn -= 1
        elif self.first_turn_b:
            self.turn -= 1
            if self.turn == -1:
                self.first_turn_b = False
                for player in self.players:
                    for vertex in self.player_houses[player]:
                        for tile in dict_of_tiles:
                            if tile in vertice_neighbors[vertex]:
                                if tile_rn[tile][0] == 'lumber':
                                    self.players[player][3] += 1
                                    self.lumber -= 1
                                if tile_rn[tile][0] == 'grain':
                                    self.players[player][4] += 1
                                    self.grain -= 1
                                if tile_rn[tile][0] == 'wool':
                                    self.players[player][5] += 1
                                    self.wool -= 1
                                if tile_rn[tile][0] == 'ore':
                                    self.players[player][6] += 1
                                    self.ore -= 1
                                if tile_rn[tile][0] == 'brick':
                                    self.players[player][7] += 1
                                    self.brick -= 1
                self.turn += 1

        elif self.turn == len(self.order):
            self.turn = 0
            r = False
        else:
            self.turn += 1
            r = False

    def vertclicked(self,vertex,x,y):
        player = self.order[self.turn]
        if player == 'player1':
            color = 'Red'
        elif player == 'player2':
            color = 'Blue'
        elif player == 'player3':
            color = 'Orange'
        else:
            color = 'White'

        if self.players[player][1] != 0 and vertex not in self.disabled_houses:
            house = QPixmap('Pieces/%s Settlement' % color)
            house = house.scaledToHeight(self.button_size)
            hlabel = QLabel(self)
            hlabel.setAlignment(Qt.AlignCenter)
            hlabel.setPixmap(house)
            hlabel.setGeometry(x+4,y+2,house.width(),house.height())
            self.players[player][1]-=1
            disabled = set(self.disabled_houses)
            new_disabled = set(vertice_neighbors[vertex])
            no_duplicates = new_disabled-disabled
            self.disabled_houses += list(no_duplicates)
            self.players[player][9] += 1
            self.player_houses[player].append(vertex)

            hlabel.show()

    def roadclicked(self,name,x,y):
        player = self.order[self.turn]

        if player == 'player1':
            color = 'Red'
        elif player == 'player2':
            color = 'Blue'
        elif player == 'player3':
            color = 'Orange'
        else:
            color = 'White'
        s1 = set(self.player_houses[player])
        s2 = set(road_neighbors[name])
        s3 = set(self.player_roads[player])
        s4 = set(vertice_neighbors[road_neighbors[name][0]])
        s5 = set(vertice_neighbors[road_neighbors[name][1]])

        if self.players[player][2] != 0 and (s1.intersection(s2) or s3.intersection(s4) or s3.intersection(s5)):
            road = QPixmap('Pieces/%s Road' % color)
            road = road.scaledToHeight(self.button_size)
            diag = (road.width()**2 + road.height()**2)**0.5
            rlabel = QLabel(self)
            rlabel.setAlignment(Qt.AlignCenter)
            rlabel.setMinimumSize(diag, diag)
            if road_direction[name] == 'UL':
                trans = -60
            elif road_direction[name] == 'UR':
                trans = 60
            else:
                trans = 0
            road = road.transformed(QTransform().rotate(trans))
            rlabel.setPixmap(road)
            rlabel.setGeometry(x,y+2,road.width(),road.height())
            self.players[player][2] -= 1
            self.player_roads[player].append(name)
            rlabel.show()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Catan()
    sys.exit(app.exec_())
