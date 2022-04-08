#include "Config.h"

Config::Config()
{
}

Config::~Config()
{
}

int Config::NUM_X_CELLS = 100;
int Config::NUM_GHOST_CELLS = 3;
int Config::NUM_RK_STEPS = 1;
double Config::STOPPING_TIME = 2.0;
int Config::MAX_TIME_ITER = 100000;
double Config::MIN_X = -1.0;
double Config::MAX_X = 1.0;
double Config::ADVECTION_VEL = 1.0;
double Config::COURANT_NUM = 0.8;