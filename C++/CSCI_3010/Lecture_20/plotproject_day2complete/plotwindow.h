#ifndef PLOTWINDOW_H
#define PLOTWINDOW_H

#include <QMainWindow>
#include <QGraphicsScene>
#include <QGraphicsView>
#include "point.h"

namespace Ui {
class PlotWindow;
}

class PlotWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit PlotWindow(QWidget *parent = 0);
    bool getMode(){ return delete_mode_; };
    ~PlotWindow();


private slots:
    // default slot that reacts to random button being clicked
    void on_randomButton_clicked();

    // Day 2, Task 2, option 1 (default slot)
//    void on_addButton_clicked();
    // Day 2, Task 2, option 2 (custom slot)
    void AddPoint();


    // Day 1, Task 5
    // custom slot that we have to connect to a signal
    void SlotTest();

    // Day 2, Task 3
    // the parameters match the parameters of the signal
    void PointSelectedSlot(Point * p);


    void on_deletePoints_clicked();
    void DeleteSelectedPointSlot(Point *p);
    void ShiftClickedPointSlot(Point *p);

private:
    void AddHelper();


    Ui::PlotWindow *ui;

    QGraphicsScene *scene;
    Point *p1_;
    Point *shiftP1_;
    bool delete_mode_;
};

#endif // PLOTWINDOW_H
