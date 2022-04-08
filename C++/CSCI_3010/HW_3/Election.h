#ifndef Election_H
#define Election_H

#include "ElectoralMap.h"

class Election{
public:
    Election(){};
    void Register(std::string name, Party p, int id); // Adds candidates to registered_
    void Campaign(Party p, int id); // Calls the District.Campaign() function
    virtual std::map<int,std::map<Candidate,int>> Tally(); // Does the tallying

    std::vector<Candidate> getRegistered(){ return registered_; };
    ElectoralMap &getMap(){ return map_; };
    
protected:
    ElectoralMap &map_ = ElectoralMap::GetInstance(); // Both private variable are share with RepresentativeElection
    std::vector<Candidate> registered_;
};

class RepresentativeElection: public Election{
public:
    RepresentativeElection():Election(){};
    std::map<int,std::map<Candidate,int>> Tally();
};

#endif