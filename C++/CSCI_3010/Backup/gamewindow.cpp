#include <iostream>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QDebug>
#include <QTime>
#include <vector>
#include <unistd.h>
#include <cmath>

#include "gamewindow.h"
#include "ui_gamewindow.h"
#include "house.h"

// Name: Nathan Jager, Samuel Razumovskiy
//
//

GameWindow::GameWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::GameWindow)
{
    // we need to set up the ui before we draw on our scene
    ui->setupUi(this);

    // the QGraphicsView is the UI element that contains the
    // scene that we will actually get to draw on.
    QGraphicsView * view = ui->GraphicsView;

    // scene is a QGraphicsScene pointer field of the PlotWindow class
    // this makes our lives easier by letting us easily access it
    // from other functions in this class.
    scene = new QGraphicsScene;
    view->setScene(scene);
    // make the scene the same size as the view containing it
    view->setSceneRect(0,0,view->frameSize().width(),view->frameSize().height());

//    place holder for aspect ratio input

    int wh = 720;
    int ww = 1280;

//    these are the distances between points that are proportional to the aspect ratio

    int dx1 = wh/12;
    int dy1 = dx1/sqrt(3);
    int dx2 = 0;
    int dy2 = dy1*2;
    int xi = ww/2 - dx1*3;
    int yi = dy1*2;
    int x = xi;
    int y = yi;
//    the list_of_dx_dy sets an order to which the change in x and y is called out, in order to get a hexagon

    std::vector<std::vector<int>> list_of_dx_dy{{dx1,-dy1,dx1,dy1},{dx1,dy1,dx2,dy2},{dx2,dy2,-dx1,dy1},{-dx1,dy1,-dx1,-dy1},{-dx1,-dy1,dx2,-dy2},{dx2,-dy2,dx1,-dy1}};

//    these loops go through the list_of_dx_dy and use the function make_vertice to create the coordinates for each new vertice
//    based off the previous one

    for (auto dxdy : list_of_dx_dy){
        for (auto i=0; i<3; i++){
            make_vertice(x, y, dxdy[0], dxdy[1]);
            if (i == 2)
                continue;
            make_vertice(x, y, dxdy[2], dxdy[3]);
        }
        x += dx1;
        y += dy1+dy2;
    }
    for (auto dxdy : list_of_dx_dy){
        for (auto i=0; i<2; i++){
            make_vertice(x, y, dxdy[0], dxdy[1]);
            if (i == 1)
                continue;
            make_vertice(x, y, dxdy[2], dxdy[3]);
        }
        x += dx1;
        y += dy1+dy2;
    }
    for (auto dxdy : list_of_dx_dy)
        make_vertice(x, y, dxdy[0], dxdy[1]);

//    finds each neighboring vertice which is a specific distance away

//    for vertex1 in dict_of_vertices:
//        vertice_neighbors[vertex1] = [] #creates a new key with blank list
//        for vertex2 in dict_of_vertices:
//            x1y1 = dict_of_vertices[vertex1] #grabs the coordinates for vert1
//            x2y2 = dict_of_vertices[vertex2] #grabs the coordinates for vert2
//            distance = math.sqrt((x1y1[0]-x2y2[0])**2+(x1y1[1]-x2y2[1])**2)
//            if distance <= dy2+1 and distance > 0: #checks if distance is close enough and adds one pixel because of rounding error
//                vertice_neighbors[vertex1].append(vertex2)


}

void GameWindow::make_vertice(int &x,int &y,int dx,int dy){
    x+=dx;
    y+=dy;
    qDebug() << x << y;
}

GameWindow::~GameWindow()
{
    delete ui;
}

