#ifndef ElectoralMap_H
#define ElectoralMap_H

#include "District.h"

class ElectoralMap{
public:
    static ElectoralMap& GetInstance() {
            // gets instantiated the first time
            static ElectoralMap instance; // guaranteed to be destroyed
            return instance;
    }

    District* get_district(int id){ return district_map_[id]; };
    void DistrictCampaign(Party p, int id){ district_map_[id]->Campaign(p); };

    int get_total_const(){ return total_constituants; };
    friend std::ostream& operator<<(std::ostream& os, ElectoralMap &m);
    static const int NUM_DISTRICTS;
    ElectoralMap(ElectoralMap const&) = delete; // copy constructor
	void operator=(ElectoralMap const&) = delete;
private:
    ElectoralMap();
    int total_constituants;
    std::map<int, District*> district_map_;
};

#endif  // ElectoralMap_H
