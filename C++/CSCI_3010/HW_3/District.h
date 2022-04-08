#ifndef District_H
#define District_H

#include <algorithm>
#include <iostream>
#include <map>
#include <stdlib.h>
#include <string>
#include <time.h> 
#include <utility>
#include <vector>
#include <cmath>

enum class Party{one,two,none};

struct Candidate{
    int id;
    std::string name;
    Party party;
    friend bool operator<(const Candidate &a, const Candidate &b);
};

class District{
public:
    District();
    void Campaign(Party p); // Does the changes to constituent numbers
    int TotalConstNotP(Party p); // Total constituents not in the given party
    int TotalConst(); // Total constituents
    Party MajorityNotP(Party p); // Majority party that is not the given party
    Party Majority(std::vector<Candidate> registered); // Majority party that has someone registered
    std::map<std::string,int> votes();

    int get_size(){ return size_; };
    std::map<Party,int> get_constituents(){ return constituent_map_; };
    int get_party(Party p){ return constituent_map_[p]; };
    friend std::ostream& operator<<(std::ostream& os, District &d);
private:
    int size_;
    std::map<Party,int> constituent_map_;
};

template <typename T1, typename T2>
bool inVec(std::vector<std::pair<T1,T2>> check, T2 in);

bool inVec(std::vector<Candidate> check, Party in);

std::string PartyToString(Party p);
std::vector<Party> getParties();
#endif