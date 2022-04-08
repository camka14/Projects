#include "Utils.h"

Utils::Utils(/* args */)
{
}

Utils::~Utils()
{
}

void Utils::writeFile(std::vector<Cell> & cells, double time)
{
    int rkStep = 0;
    std::ofstream myfile(Config::basePath_ + std::string("Solution") + std::to_string(filecounter_));
    myfile << "NumXCells: " << Config::NUM_X_CELLS << "\n";
    myfile << "NumGhostCells: " << Config::NUM_GHOST_CELLS << "\n";
    myfile << "time: " << time << "\n";

    for(auto cell: cells)
    {
        myfile << cell.cx() << " " << cell.u()[rkStep] << "\n";
    }
    filecounter_++;
}

void Utils::initialize(std::vector<Cell> & cells)
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

int Utils::getTimeStep(std::vector<Cell> & cells)
{
    return cells[0].dx()/abs(Config::ADVECTION_VEL)*Config::COURANT_NUM;
}

void Utils::updateGhostCells(std::vector<Cell> & cells, int rkStep)
{
    for(int ghostCell = 0; Config::NUM_GHOST_CELLS; ghostCell++)
    {
        cells[ghostCell].u()[rkStep] = cells[Config::NUM_GHOST_CELLS + ghostCell].u()[rkStep];
        cells[Config::NUM_GHOST_CELLS + Config::NUM_GHOST_CELLS].u()[rkStep] = cells[Config::NUM_GHOST_CELLS + ghostCell].u()[rkStep];
    }
}

void Utils::reconstruct(std::vector<Cell> & cells, int rkStep)
{
    for(int i = Config::NUM_GHOST_CELLS-1; i<Config::NUM_GHOST_CELLS+Config::NUM_X_CELLS+1;i++)
    {
        cells[i].uWest() = cells[i].u()[rkStep];
        cells[i].uEast() = cells[i].u()[rkStep];
    }
}