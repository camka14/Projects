#include "CFDSolverStructured.h"

CFDSolverStructured::CFDSolverStructured() : cells_(Config::NUM_X_CELLS+2*Config::NUM_GHOST_CELLS, Cell())
{
    double dx = (Config::MAX_X - Config::MIN_X) / (double) Config::NUM_X_CELLS;
    double centroid = Config::MIN_X - (double) Config::NUM_GHOST_CELLS*dx + dx/2;
    for(auto & cell: cells_)
    {
        cell.dx() = dx;
        cell.cx() = centroid;
        centroid += dx;
    }
    utils_.initialize(cells_);
    time_ = 0.0;
    utils_.writeFile(cells_, time_);
    Solve();
}

CFDSolverStructured::~CFDSolverStructured()
{
}

void CFDSolverStructured::Solve()
{
    bool lastTimeStep = false;
    for(int timeIter = 0; timeIter < Config::MAX_TIME_ITER; timeIter++)
    {
        double dt = utils_.getTimeStep(cells_);
        if(time_ + dt > Config::STOPPING_TIME)
        {
            dt = Config::STOPPING_TIME - time_;
            lastTimeStep = true;
        }

        for(int rkStep = 0; rkStep < Config::NUM_RK_STEPS; rkStep++)
        {
            utils_.updateGhostCells(cells_, rkStep);
            utils_.reconstruct(cells_, rkStep);
            flux_.calcFlux(cells_);
        }

        time_ += dt;
        if(lastTimeStep)
        {
            break;
        }
    }
}