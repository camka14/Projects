#ifndef GOHSTCELLUPDATER_H
#define GOHSTCELLUPDATER_H

#include "Cell.h"

class GhostCellUpdater
{
private:
    
public:
    GhostCellUpdater();
    ~GhostCellUpdater();
    void updateGhostCells(std::vector<Cell> & cells, int rkStep);
};

GhostCellUpdater::GhostCellUpdater()
{
}

GhostCellUpdater::~GhostCellUpdater()
{
}

void GhostCellUpdater::updateGhostCells(std::vector<Cell> & cells, int rkStep)
{
    for(int ghostCell = 0; Config::NUM_GHOST_CELLS; ghostCell++)
    {
        cells[ghostCell].u()[rkStep] = cells[Config::NUM_GHOST_CELLS + ghostCell].u()[rkStep];
        cells[Config::NUM_GHOST_CELLS + Config::NUM_GHOST_CELLS].u()[rkStep] = cells[Config::NUM_GHOST_CELLS + ghostCell].u()[rkStep];
    }
}

#endif