#ifndef VARIABLErECONSTRUCTOR_H
#define VARIABLErECONSTRUCTOR_H

#include "Cell.h"

class VariableReconstructor
{
private:
    /* data */
public:
    VariableReconstructor(/* args */);
    ~VariableReconstructor();
    void reconstruct(std::vector<Cell> & cells, int rkStep);
};

VariableReconstructor::VariableReconstructor(/* args */)
{
}

VariableReconstructor::~VariableReconstructor()
{
}

void VariableReconstructor::reconstruct(std::vector<Cell> & cells, int rkStep)
{
    for(int i = Config::NUM_GHOST_CELLS-1; i<Config::NUM_GHOST_CELLS+Config::NUM_X_CELLS+1;i++)
    {
        cells[i].uWest() = cells[i].u()[rkStep];
        cells[i].uEast() = cells[i].u()[rkStep];
    }
}


#endif