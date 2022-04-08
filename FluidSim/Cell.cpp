#include "Cell.h"

Cell::Cell() : u_(Config::NUM_RK_STEPS+1,0)
{
}

Cell::~Cell()
{
}