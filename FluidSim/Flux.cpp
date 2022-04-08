#include "Flux.h"

Flux::Flux(/* args */)
{
}

Flux::~Flux()
{
}

void Flux::calcFlux(std::vector<Cell> & cells)
{
    for(int interfaceInd = Config::NUM_X_CELLS; interfaceInd<Config::NUM_X_CELLS+Config::NUM_GHOST_CELLS+1 ; interfaceInd++)
    {
        for(auto & cell: cells)
            cell.totalFlux() = 0.0;

        double lefValue = cells[interfaceInd-1].uEast();
        double rightValue = cells[interfaceInd+1].uWest();

        double flux = 0.5*Config::ADVECTION_VEL*(lefValue+rightValue) - 0.5*abs(Config::ADVECTION_VEL)*(rightValue-lefValue);

        cells[interfaceInd-1].totalFlux() += flux;
        cells[interfaceInd].totalFlux() += flux;
    }
}