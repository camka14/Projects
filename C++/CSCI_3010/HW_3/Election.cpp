#include "Election.h"

void Election::Register(std::string name, Party p, int id){
    Candidate c = { id = id, .name = name, .party = p};
    registered_.push_back(c);

}

void Election::Campaign(Party p, int id){
    map_.DistrictCampaign(p,id);
}

std::map<int,std::map<Candidate,int>> Election::Tally(){
    std::map<int,std::map<Candidate,int>> counter;
    District *d;
    std::vector<Candidate> p_members;
    int voters;
    int vote;

    for(int i=1; i<=map_.NUM_DISTRICTS; i++){
        d = map_.get_district(i);
        for(auto &p: getParties()){
            voters = d->get_party(p);

            // If party doesn't have a candidate sets the majority party
            if(p == Party::none || !inVec(registered_, p)){
                p = d->Majority(registered_);
            }

            // Adds candidates to p_members and adds them to the counter
            for(auto &can: registered_){
                if(can.party == p)
                    p_members.push_back(can);
                if(counter[i].count(can) == 0)
                    counter[i].insert(std::make_pair(can,0));
            }

            // Voters randomly choose between candidates in the party
            for(int j=0; j<voters; j++){
                vote = rand() % p_members.size();
                counter[i][p_members[vote]]++;
            }
            p_members.clear();
        }
    }
    return counter;
}

std::map<int,std::map<Candidate,int>> RepresentativeElection::Tally(){
    std::map<int,std::map<Candidate,int>> counter;
    District *d;
    std::vector<Candidate> p_members;
    std::map<int,std::map<Candidate,int>> RepCounter;
    std::map<Candidate,int> winner;
    Candidate c;
    winner.insert(std::make_pair(c, -1));
    int voters;
    int vote;

    // Same as before but an added step
    for(int i=1; i<=map_.NUM_DISTRICTS; i++){
        d = map_.get_district(i);
        for(auto p: getParties()){
            voters = d->get_party(p);
            if(p == Party::none || !inVec(registered_, p)){
                p = d->Majority(registered_);
            }
            for(auto &can: registered_){
                if(can.party == p)
                    p_members.push_back(can);
                if(counter[i].count(can) == 0)
                    counter[i].insert(std::make_pair(can,0));
            }
            for(int j=0; j<voters; j++){
                vote = rand() % p_members.size();
                counter[i][p_members[vote]]++;
            }
            p_members.clear();
        }

        // Added step: Checks who has the most votes and sets them to the winner variable
        for(auto &Memb: counter[i]){
            if(Memb.second > winner.begin()->second){
                winner.clear();
                winner.insert(std::make_pair(Memb.first, Memb.second));
            }
        }

        // Uses the Representative election equation for votes
        winner.begin()->second = (int)floor((double)d->TotalConst()/map_.get_total_const()*map_.NUM_DISTRICTS*5);
        RepCounter[i] = winner;
    }

    return RepCounter;
}