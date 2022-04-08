#include <iostream>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QDebug>
#include <QTime>
#include <QLineF>
#include <QPen>

#include "plotwindow.h"
#include "ui_plotwindow.h"

// Name: Samuel Razumovskiy
//
//

PlotWindow::PlotWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::PlotWindow)
{
    // we need to set up the ui before we draw on our scene
    ui->setupUi(this);

    // the QGraphicsView is the UI element that contains the
    // scene that we will actually get to draw on.
    view = ui->plotGraphicsView;

    // scene is a QGraphicsScene pointer field of the PlotWindow class
    // this makes our lives easier by letting us easily access it
    // from other functions in this class.
    scene = new QGraphicsScene;
    view->setScene(scene);
    // make the scene the same size as the view containing it
    view->setSceneRect(0,0,view->frameSize().width(),view->frameSize().height());

    // we'll want to generate random numbers later so we're
    // going to seed our random number generator once
    qsrand(static_cast<unsigned>(QTime::currentTime().msec()));


    qDebug() << "Here's an example debugging statement";
    double width = view->frameSize().width();
    double height = view->frameSize().height();
    scene->addLine(QLineF(0,height/2,width,height/2),QPen()); // X-axis
    scene->addLine(QLineF(width/2,0,width/2,height),QPen()); // Y-axis

    // Day 1, Task 5, number 2 here.
    connect(ui->randomButton, &QAbstractButton::pressed, this, &PlotWindow::SlotTest);

    QColor c(0,0,0);

    Point *p = new Point(c,width/2,height/2);
    scene->addItem(p);

}

// Day 1, Task 5, number 1 here.



PlotWindow::~PlotWindow()
{
    delete ui;
}

void PlotWindow::on_randomButton_clicked()
{
    qDebug() << "You clicked the Random Button!";
}

void PlotWindow::SlotTest()
{
    qDebug() << "Test Slot Please Ignore";
}

void PlotWindow::on_addButton_clicked()
{
    // &safe is the address of a boolean value that will be set to True if the
    // method successfully converted the text to an int and False otherwise
    bool safex = false;
    bool safey = false;
    int x = ui->xCoord->text().toInt(&safex);
    int y = ui->yCoord->text().toInt(&safey);
    int x_adj = view->frameSize().width()/2-Point::get_width()/2+x;
    int y_adj = view->frameSize().height()/2-Point::get_width()/2-y;
    if (!safex || !safey) {
        return;
    }

    QColor c(0,0,0);
    Point *p = new Point(c,x_adj,y_adj);
    connect(p,SIGNAL(PointSelected(int,int)),p,SLOT(PointClickedSlot(int,int)));
    scene->addItem(p);
}
