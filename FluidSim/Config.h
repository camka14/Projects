#ifndef CONFIG_H
#define CONFIG_H

#include <string>

class Config
{
private:
    /* data */
public:
    static int NUM_X_CELLS;
    static int NUM_GHOST_CELLS;
    static int NUM_RK_STEPS;
    static double STOPPING_TIME;
    static int MAX_TIME_ITER;
    static double MIN_X;
    static double MAX_X;
    static double ADVECTION_VEL;
    static double COURANT_NUM;

    inline static std::string basePath_ = "./out/";
    Config();
    ~Config();
};

#endif