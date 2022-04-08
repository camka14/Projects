#include "District.h"


District::District(){
    size_ = rand() % 24 + 5;
    std::map<Party,int>::iterator it = constituent_map_.begin();
    constituent_map_.insert(it, std::pair<Party,int>(Party::one,rand()%10));
    constituent_map_.insert(it, std::pair<Party,int>(Party::two,rand()%10));
    constituent_map_.insert(it, std::pair<Party,int>(Party::none,rand()%10));
    
}

int District::TotalConstNotP(Party p){
    int total = 0;
    for(auto &it: constituent_map_){
        if(it.first != p && it.first != Party::none){
        total += it.second;
        }
    }
    return total;
}

int District::TotalConst(){
    int total = 0;
    for(auto &it: constituent_map_){
        total += it.second;
    }
    return total;
}

Party District::MajorityNotP(Party p){
    std::vector<Party> major;
    std::vector<int> value;
    int i = 0;
    int max = 0;
    int imax = 0;
    for(auto &it: constituent_map_){
        if(it.first != p && it.first != Party::none){
            major.push_back(it.first);
            value.push_back(it.second);
            if(it.second > max){
                max = it.second;
                imax = i;
            }
            i++;
        }
    }
    return major[imax];
}

Party District::Majority(std::vector<Candidate> registered){
    std::vector<Party> major;
    std::vector<int> value;
    int i = 0;
    int max = 0;
    int imax = 0;
    for(auto &it: constituent_map_){
        if(inVec(registered, it.first)){
            major.push_back(it.first);
            value.push_back(it.second);
            if(it.second > max){
                max = it.second;
                imax = i;
            }
            i++;
        }
    }
    return major[imax];
}

void District::Campaign(Party p){
    double per;
    double perex;
    double chance;
    per = std::min(100.0,((double)constituent_map_[p]+1)*2/(double)TotalConstNotP(p)*(((double)constituent_map_[p]+1)*2/(double)size_)*100.0); // Math
    perex = per*0.1;
    std::cout << "Chances to convert: " << per << std::endl;
    std::cout << "Chances to convert from another party: " << perex << std::endl;
    chance = (double)rand() / RAND_MAX * 100;

    // Outputs who it converted
    if(chance <= perex && constituent_map_[MajorityNotP(p)] != 0){
        std::cout << "Congrats, you have converted someone from " << PartyToString(MajorityNotP(p)) << " to " << PartyToString(p) << "!" << std::endl;
        constituent_map_[MajorityNotP(p)]--;
        constituent_map_[p]++;
    }
    if(chance <= per && constituent_map_[Party::none] != 0){
        std::cout << "Congrats, you have converted someone from none to " << PartyToString(p) << "!" << std::endl;
        constituent_map_[p]++;
        constituent_map_[Party::none]--;
    }
}

///////////////////////////////////////////////////////
/////////////// Helper Functions //////////////////////
///////////////////////////////////////////////////////


std::ostream& operator<<(std::ostream& os, District &d){
    os << d.get_size();
    return os;
}

std::string PartyToString(Party p){
    if(p == Party::one){
        return "one";
    }else if(p == Party::two){
        return "two";
    }else{
        return "none";
    }
}

std::vector<Party> getParties(){
    std::vector<Party> p = {Party::one,Party::two,Party::none};
    return p;
}

template <typename T1, typename T2>
bool inVec(std::vector<std::pair<T1,T2>> check, T2 in){
    for(auto it: check){
        if(it.second == in){
            return true;
        }
    }
    return false;
}

bool inVec(std::vector<Candidate> check, Party in){
    for(auto it: check){
        if(it.party == in){
            return true;
        }
    }
    return false;
}

bool operator<(const Candidate &a, const Candidate &b)
{
    if(PartyToString(a.party) < PartyToString(b.party)){
        return true;
    }else if(PartyToString(a.party) == PartyToString(b.party)){
        if(a.name < b.name){
            return true;
        }
    }
    return false;
}