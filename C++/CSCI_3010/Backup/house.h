#ifndef HOUSE_H
#define HOUSE_H

#include <QObject>

class House : public QObject
{
    Q_OBJECT
public:
    House(int x, int y){ x_=x;y_=y;};
    virtual ~House(){};

private:
    int x_;
    int y_;

signals:

};

#endif // HOUSE_H
