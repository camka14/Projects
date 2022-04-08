#ifndef TextUI_H
#define TextUI_H

#include "Election.h"

class TextUI{
public:
    TextUI(){};
    void Start(); // Main UI loop
    int Selection();
    void Registration();
    void Campaigning();
    void PrintMap();
    void Results();

    std::vector<Candidate> getRegistered(){ return e_->getRegistered(); };

private:
    Election *e_;
    int numDistricts;

};

#endif