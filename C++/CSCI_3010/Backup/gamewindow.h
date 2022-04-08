#ifndef GAMEWINDOW_H
#define GAMEWINDOW_H

#include <QMainWindow>
#include <QStandardItemModel>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QHeaderView>
#include <map>

namespace Ui {
class GameWindow;
}

class GameWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit GameWindow(QWidget *parent = 0);
    ~GameWindow();


private:
    void make_vertice(int &x,int &y,int dx,int dy);

    Ui::GameWindow *ui;

    QGraphicsScene *scene;

};

#endif // GAMEWINDOW_H
