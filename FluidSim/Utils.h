#ifndef UTILS_H
#define UTILS_H

#include <iostream>
#include <fstream>
#include <cmath>
#include "Cell.h"

class Utils
{
private:
    inline static int filecounter_;
    
public:
    Utils(/* args */);
    ~Utils();
    void writeFile(std::vector<Cell> & cells, double time);
    void initialize(std::vector<Cell> & cells);
    int getTimeStep(std::vector<Cell> & cells);
    void updateGhostCells(std::vector<Cell> & cells, int rkStep);
    void reconstruct(std::vector<Cell> & cells, int rkStep);

};

#endif