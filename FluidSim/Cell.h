#ifndef CELL_H
#define CELL_H

#include <vector>
#include "Config.h"

class Cell
{
private:
    std::vector<double> u_;
    double uWest_, uEast_;
    double cx_;
    double dx_;
    double totalFlux_;
public:
    Cell();
    ~Cell();
    double & cx() { return cx_; }
    double & dx() { return dx_; }
    double & uWest() { return uWest_; }
    double & uEast() { return uEast_; }
    double & totalFlux() { return totalFlux_; }
    std::vector<double> & u() { return u_; }
};

#endif