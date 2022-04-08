#include "ElectoralMap.h"

const int ElectoralMap::NUM_DISTRICTS = 4;

ElectoralMap::ElectoralMap(){
    for(int i=0; i<NUM_DISTRICTS; i++){
        District *dis = new District();
        district_map_.insert (std::make_pair(i+1,dis));
        total_constituants += dis->TotalConst();
    }
}

std::ostream& operator<<(std::ostream& os, ElectoralMap &m){
    for(std::pair<int, District*> el: m.district_map_){
        os << el.first << "," << *el.second << std::endl;
    }
    return os;
}