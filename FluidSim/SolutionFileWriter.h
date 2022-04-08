#ifndef SOLUTIONFILEWRITER_H
#define SOLUTIONFILEWRITER_H

#include <iostream>
#include <fstream>
#include "Cell.h"

class SolutionFileWriter
{
private:
    inline static int filecounter_;
public:
    SolutionFileWriter();
    ~SolutionFileWriter();
    void writeFile(std::vector<Cell> & cells, double time);
};

SolutionFileWriter::SolutionFileWriter()
{
}

SolutionFileWriter::~SolutionFileWriter()
{
}

void SolutionFileWriter::writeFile(std::vector<Cell> & cells, double time)
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


#endif