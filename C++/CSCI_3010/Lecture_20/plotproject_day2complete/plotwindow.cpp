#include <iostream>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QDebug>
#include <QTime>

#include "plotwindow.h"
#include "ui_plotwindow.h"
#include "point.h"

// Name:
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
    QGraphicsView * view = ui->plotGraphicsView;

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


    // Complete Day 1, Task 2, number 1 here.
    // Calculate the mid points
    int x_mid = view->frameSize().height() / 2;
    int y_mid = view->frameSize().width() / 2;
    // draw the axes
    // this is the horizontal line
    scene->addLine(0, x_mid, view->frameSize().width(), x_mid);
    // this is the vertical line
    scene->addLine(y_mid, 0, y_mid, view->frameSize().height());

    // Day 1, Task 5, number 2 here.
    connect(ui->randomButton, &QAbstractButton::pressed, this, &PlotWindow::SlotTest);

    // equations to calculate adjusted coordinates
    //int x_adj = x + (ui->plotGraphicsView->frameSize().width() / 2);
    //int y_adj = (-1 * y + (ui->plotGraphicsView->frameSize().height() / 2));


    // Slots & signals
    // 1) default signal + default slot (on_randomButton_clicked)
    // 2) default signal + custom slot (SlotTest)
    //      make sure to connect the signal to the slot
    // 3) custom signal + custom slot
    //      define the signal & the slot (matching parameters)
    //      emit the signal
    //      connect the signal to the slot
    // the sender is a point, so wherever you are instantiating points (not within the Point constructor)
    // is where you want to call connect

    // Day 2, Task 1, number 1
    // instantiate a color and a point
    QColor color(255,0,0);
    Point * p = new Point(color, 10, 20);
    // add it to the scene
    scene->addItem(p);
    // connect the custom signal to the custom slot
    connect(p, &Point::PointSelected, this, &PlotWindow::PointSelectedSlot);
    connect(p, &Point::DeletePoint, this, &PlotWindow::PointSelectedSlot);
    connect(p, &Point::ShiftClicked, this, &PlotWindow::ShiftClickedPointSlot);

    // Day 2, Task 1, number 2
    // instantiate a color and a point
    QColor color2(255,0,255);
    // adjust for the width as well to make it appear at the origin
    int x_adj = 0 + (ui->plotGraphicsView->frameSize().width() / 2) - (Point::get_width() / 2);
    int y_adj = (-1 * 0 + (ui->plotGraphicsView->frameSize().height() / 2)) - (Point::get_width() / 2);
    Point * p2 = new Point(color2, x_adj, y_adj);
    // add it to the scene
    scene->addItem(p2);
    // connect the custom signal to the custom slot
    connect(p2, &Point::PointSelected, this, &PlotWindow::PointSelectedSlot);
    connect(p2, &Point::DeletePoint, this, &PlotWindow::DeleteSelectedPointSlot);
    connect(p2, &Point::ShiftClicked, this, &PlotWindow::ShiftClickedPointSlot);

    // Day 2, Task 2 (option 2, custom slot)
    // needs to be "clicked" and not "click" to be a signal!
    connect(ui->addButton, &QAbstractButton::clicked, this, &PlotWindow::AddPoint);
    p1_ = nullptr;
    delete_mode_ = false;
    shiftP1_ = nullptr;
}

// Day 2, Task 3
void PlotWindow::PointSelectedSlot(Point *p) {
    if(delete_mode_){
        delete p;
        return;
    }
    qDebug() << p->get_x() << ":" << p->get_y();
    if(p1_== nullptr){
        std::string s = "Point 1: (" + std::to_string(p->get_x()) + ", " + std::to_string(p->get_y()) + ")";
        QString qs(s.c_str());
        ui->point1Label->setText(qs);
        p1_ = p;
    }else{
        std::string s = "Point 2: (" + std::to_string(p->get_x()) + ", " + std::to_string(p->get_y()) + ")";
        QString qs(s.c_str());
        ui->point2Label->setText(qs);
        s = "Distance: " + std::to_string(p1_->Distance(*p));
        QString dis(s.c_str());
        ui->distanceLabel->setText(dis);
        p1_ = nullptr;
    }
}

// Day 2, Task 2 (helper function to demonstrate default and custom implementations)
void PlotWindow::AddHelper() {
   bool safe = false;
   int x = ui->xCoord->text().toInt(&safe);
   if (!safe) {
       return;
   }
   // do the same thing for the y coordinate
   int y = ui->yCoord->text().toInt(&safe);
   if (!safe) {
       return;
   }

     // then create your point and add it to the scene!
   QColor c(0, 0, 155);
   int x_adj = x + (ui->plotGraphicsView->frameSize().width() / 2);
   // account for the width of the point
   x_adj = x_adj - Point::get_width() / 2;
   int y_adj = (-1 * y + (ui->plotGraphicsView->frameSize().height() / 2));
   // account for the height of the point (which is the same as the width because it's a circle)
   y_adj = y_adj - Point::get_width() / 2;
   Point * p = new Point(c, x_adj, y_adj);
   scene->addItem(p);
   connect(p, &Point::PointSelected, this, &PlotWindow::PointSelectedSlot);
   connect(p, &Point::DeletePoint, this, &PlotWindow::PointSelectedSlot);
   connect(p, &Point::ShiftClicked, this, &PlotWindow::ShiftClickedPointSlot);
}

// Day 2, Task 2 (option 1, default slot)
//void PlotWindow::on_addButton_clicked() {
//    this->AddHelper();
//}

// Day 2, Task 2 (option 1, custom slot)
void PlotWindow::AddPoint() {
    this->AddHelper();
}


// Day 1, Task 5, number 1 here.
void PlotWindow::SlotTest() {
    qDebug() << "random button pressed custom slot!";
}



PlotWindow::~PlotWindow()
{
    delete ui;
}

void PlotWindow::on_randomButton_clicked()
{
    qDebug() << "random button clicked default slot!";
}

void PlotWindow::on_deletePoints_clicked()
{
    if(delete_mode_){
        ui->centralWidget->setCursor(Qt::ArrowCursor);
        ui->deletePoints->setStyleSheet("background-color: rgb(225, 225, 225)");
        delete_mode_ = false;
    }
    else{
        ui->centralWidget->setCursor(Qt::CrossCursor);
        ui->deletePoints->setStyleSheet("background-color: rgb(255, 0, 0)");
        delete_mode_ = true;
    }
}

void PlotWindow::DeleteSelectedPointSlot(Point *p)
{
    if(delete_mode_)
        scene->removeItem(p);
}
void PlotWindow::ShiftClickedPointSlot(Point *p)
{
    if(!delete_mode_){
        if(shiftP1_ == nullptr)
            shiftP1_ = p;
        else{
            int x1 = shiftP1_->get_x() + p->get_width()/2;
            int y1 = shiftP1_->get_y() + p->get_width()/2;
            int x2 = p->get_x() + p->get_width()/2;
            int y2 = p->get_y() + p->get_width()/2;
            scene->addLine(x1, y1, x2, y2);
            shiftP1_ = p;
        }
    }

}
