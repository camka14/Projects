#ifndef SOLUTIONINITIALIZER_H
#define SOLUTIONINITIALIZER_H

#include "Cell.h"
#include <iostream>

class SolutionInitializer
{
private:
    
public:
    SolutionInitializer();
    ~SolutionInitializer();
    void initialize(std::vector<Cell> & cells);
};

SolutionInitializer::SolutionInitializer()
{
}

SolutionInitializer::~SolutionInitializer()
{
}

void SolutionInitializer::initialize(std::vector<Cell> & cells)
{
    int rkStep = 0;
    for(auto & cell: cells)
    {
        if(cell.cx() > -0.25 && cell.cx() < 0.25){
            cell.u()[rkStep] = 1.0;
        }
        else
            cell.u()[rkStep] = 0.0;
    }
}


#endif