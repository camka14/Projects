/********************************************************************************
** Form generated from reading UI file 'gamewindow.ui'
**
** Created by: Qt User Interface Compiler version 5.14.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GAMEWINDOW_H
#define UI_GAMEWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGraphicsView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_GameWindow
{
public:
    QWidget *centralWidget;
    QGraphicsView *GraphicsView;
    QPushButton *stepButton;
    QPushButton *playButton;
    QPushButton *pauseButton;
    QSlider *horizontalSlider;
    QLabel *speedLabel;
    QLabel *SlowerLabel;
    QLabel *FasterLabel;
    QLabel *turnLabel;
    QLabel *popLabel;
    QGraphicsView *columnView;
    QGraphicsView *tableView;
    QPushButton *resetButton;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *GameWindow)
    {
        if (GameWindow->objectName().isEmpty())
            GameWindow->setObjectName(QString::fromUtf8("GameWindow"));
        GameWindow->resize(741, 691);
        centralWidget = new QWidget(GameWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        GraphicsView = new QGraphicsView(centralWidget);
        GraphicsView->setObjectName(QString::fromUtf8("GraphicsView"));
        GraphicsView->setGeometry(QRect(20, 50, 0, 511));
        stepButton = new QPushButton(centralWidget);
        stepButton->setObjectName(QString::fromUtf8("stepButton"));
        stepButton->setGeometry(QRect(20, 580, 71, 25));
        playButton = new QPushButton(centralWidget);
        playButton->setObjectName(QString::fromUtf8("playButton"));
        playButton->setGeometry(QRect(110, 580, 71, 25));
        pauseButton = new QPushButton(centralWidget);
        pauseButton->setObjectName(QString::fromUtf8("pauseButton"));
        pauseButton->setGeometry(QRect(200, 580, 71, 25));
        horizontalSlider = new QSlider(centralWidget);
        horizontalSlider->setObjectName(QString::fromUtf8("horizontalSlider"));
        horizontalSlider->setGeometry(QRect(430, 580, 211, 22));
        horizontalSlider->setMinimum(0);
        horizontalSlider->setMaximum(99);
        horizontalSlider->setOrientation(Qt::Horizontal);
        horizontalSlider->setTickPosition(QSlider::NoTicks);
        speedLabel = new QLabel(centralWidget);
        speedLabel->setObjectName(QString::fromUtf8("speedLabel"));
        speedLabel->setGeometry(QRect(380, 620, 101, 16));
        SlowerLabel = new QLabel(centralWidget);
        SlowerLabel->setObjectName(QString::fromUtf8("SlowerLabel"));
        SlowerLabel->setGeometry(QRect(380, 580, 47, 21));
        SlowerLabel->setAutoFillBackground(false);
        FasterLabel = new QLabel(centralWidget);
        FasterLabel->setObjectName(QString::fromUtf8("FasterLabel"));
        FasterLabel->setGeometry(QRect(650, 580, 47, 21));
        turnLabel = new QLabel(centralWidget);
        turnLabel->setObjectName(QString::fromUtf8("turnLabel"));
        turnLabel->setGeometry(QRect(20, 10, 61, 16));
        popLabel = new QLabel(centralWidget);
        popLabel->setObjectName(QString::fromUtf8("popLabel"));
        popLabel->setGeometry(QRect(20, 30, 161, 16));
        columnView = new QGraphicsView(centralWidget);
        columnView->setObjectName(QString::fromUtf8("columnView"));
        columnView->setGeometry(QRect(60, 470, 581, 101));
        columnView->setMinimumSize(QSize(0, 0));
        columnView->setMaximumSize(QSize(1000, 1000));
        columnView->setFrameShape(QFrame::NoFrame);
        columnView->setSizeAdjustPolicy(QAbstractScrollArea::AdjustToContents);
        tableView = new QGraphicsView(centralWidget);
        tableView->setObjectName(QString::fromUtf8("tableView"));
        tableView->setGeometry(QRect(60, 60, 582, 402));
        tableView->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        tableView->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
        resetButton = new QPushButton(centralWidget);
        resetButton->setObjectName(QString::fromUtf8("resetButton"));
        resetButton->setGeometry(QRect(110, 610, 71, 25));
        GameWindow->setCentralWidget(centralWidget);
        mainToolBar = new QToolBar(GameWindow);
        mainToolBar->setObjectName(QString::fromUtf8("mainToolBar"));
        GameWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(GameWindow);
        statusBar->setObjectName(QString::fromUtf8("statusBar"));
        GameWindow->setStatusBar(statusBar);

        retranslateUi(GameWindow);

        QMetaObject::connectSlotsByName(GameWindow);
    } // setupUi

    void retranslateUi(QMainWindow *GameWindow)
    {
        GameWindow->setWindowTitle(QCoreApplication::translate("GameWindow", "PlotWindow", nullptr));
        stepButton->setText(QCoreApplication::translate("GameWindow", "Step", nullptr));
        playButton->setText(QCoreApplication::translate("GameWindow", "Play", nullptr));
        pauseButton->setText(QCoreApplication::translate("GameWindow", "Pause", nullptr));
        speedLabel->setText(QCoreApplication::translate("GameWindow", "Speed: 1.000000", nullptr));
        SlowerLabel->setText(QCoreApplication::translate("GameWindow", "Slower", nullptr));
        FasterLabel->setText(QCoreApplication::translate("GameWindow", "Faster", nullptr));
        turnLabel->setText(QCoreApplication::translate("GameWindow", "Turn: 0", nullptr));
        popLabel->setText(QCoreApplication::translate("GameWindow", "Population: 0 (0%)", nullptr));
        resetButton->setText(QCoreApplication::translate("GameWindow", "Reset", nullptr));
    } // retranslateUi

};

namespace Ui {
    class GameWindow: public Ui_GameWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GAMEWINDOW_H
