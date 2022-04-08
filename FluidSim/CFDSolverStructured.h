#ifndef CFDSOLVERSTRUCTURED_H
#define CFDSOLVERSTRUCTURED_H

#include "Flux.h"
#include "Utils.h"

class CFDSolverStructured
{
private:
    Flux flux_;
    Utils utils_;
    double time_;
    
    std::vector<Cell> cells_;
public:
    CFDSolverStructured();
    ~CFDSolverStructured();
    void Solve();
};

#endif