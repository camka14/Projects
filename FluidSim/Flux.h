#ifndef FLUX_H
#define FLUX_H

#include "Cell.h"
#include <cmath>

class Flux
{
private:
    /* data */
public:
    Flux();
    ~Flux();
    void calcFlux(std::vector<Cell> & cells);
};

#endif