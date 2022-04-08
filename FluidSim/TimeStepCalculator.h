#ifndef TIMESTEPCALCULATOR_H
#define TIMESTEPCALCULATOR_H

#include "Cell.h"
#include <cmath>

class TimeStepCalculator
{
private:
    
public:
    TimeStepCalculator();
    ~TimeStepCalculator();
    int getTimeStep(std::vector<Cell> & cells);
};

TimeStepCalculator::TimeStepCalculator()
{
}

TimeStepCalculator::~TimeStepCalculator()
{
}

int TimeStepCalculator::getTimeStep(std::vector<Cell> & cells)
{
    return cells[0].dx()/abs(Config::ADVECTION_VEL)*Config::COURANT_NUM;
}


#endif