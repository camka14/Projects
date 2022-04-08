#include "TextUI.h"

void TextUI::Start(){
    int choice = 1;
    // Loops until user inputs 0 for Selection
    while(true){
        choice = Selection();
        if(choice == 0)
            break;
        Registration();
        Campaigning();
        Results();
        delete e_;
    }
}

int TextUI::Selection(){
    std::string choice;
    std::cout << "What kind of election should we have (direct or representative, 0 to stop)? ";
    while(true){
        std::cin >> choice;
        transform(choice.begin(), choice.end(), choice.begin(), ::toupper); // changes input to be case insensitve
        if(choice == "DIRECT"){
            e_ = new Election(); // Starts new Election
            numDistricts = e_->getMap().NUM_DISTRICTS;
            break;
        }else if(choice == "REPRESENTATIVE"){
            e_ = new RepresentativeElection(); // Starts new representative election
            numDistricts = e_->getMap().NUM_DISTRICTS;
            break;
        }else if(choice == "0"){
            return 0;
        }else{
            std::cout << "Enter valid option ";
        }
    }
    return 1;
}

void TextUI::Registration(){
    int id = 1;
    // Loops through the party options
    for(auto &it: getParties()){
        if(it != Party::none){ // Only gives options for not none parties
            std::string choice;
            while(true){
                std::cout << "Do you want to register a candidate for party "<< PartyToString(it) << " (y or n)? ";
                std::cin >> choice;
                transform(choice.begin(), choice.end(), choice.begin(), ::toupper); // Case insensitve options
                if(choice == "Y"){
                    std::string name;
                    std::cout << "What is their name? ";
                    std::cin >> name;
                    e_->Register(name, it, id); // Adds candidate to regisered list
                    id++;

                }else if(choice == "N"){
                    break;
                }else{
                    std::cout << "Enter valid option " << std::endl;
                }
            }
        }
    }
}

// Helper function for sorting
bool sortbysec(const Candidate &a, 
              const Candidate &b) 
{ 
    return (a.party < b.party); 
} 

void TextUI::Campaigning(){
    int i = 1;
    std::string idN;
    std::string idD;
    std::vector<Candidate> registered = e_->getRegistered();
    std::vector<Party> parties;
    sort(registered.begin(),registered.end(),sortbysec); // Sorts the registered vector of pairs

    do{
        std::cout << "-----------------" << std::endl;
        i = 1;
        // Prints member options
        for(auto &it: registered){
            std::cout << it.id << ": " << it.name << " [Party: " << PartyToString(it.party) << "]\n";
            i++;
        }

        std::cout << "\n\nWhich candidate is campaigning (id) (0 to stop)? ";
        std::cin >> idN;
        if(stoi(idN) <= registered.size() && stoi(idN) != 0){
            do{
                PrintMap(); 
                std::cout << "Where is this candidate campaigning (id) (0 to stop)? ";
                std::cin >> idD;

                // if the option is 1-number of districts it campaigns in the selected district
                if(stoi(idD) <= numDistricts  && stoi(idD) != 0){
                    std::cout << registered[stoi(idN)-1].name << " is campaigning in District " << stoi(idD) << std::endl;
                    e_->Campaign(registered[stoi(idN)-1].party,stoi(idD));
                }else if(stoi(idD) < 0 || stoi(idD) > numDistricts){
                    std::cout << "Enter valid option " << std::endl;
                }
            }while(stoi(idD) != 0);

        }else if(stoi(idN) < 0 || stoi(idN) > registered.size()){
            std::cout << "Enter valid option " << std::endl;
        }
    }while(idN != "0");
}

// Prints the map
void TextUI::PrintMap(){
    ElectoralMap &m = e_->getMap();
    District *d;
    for(int i=1; i<=m.NUM_DISTRICTS; i++){
        d = m.get_district(i);
        std::cout << "District " << i << ":" << std::endl;
        std::cout << "Square miles: " << d->get_size() << std::endl;
        for(auto &it: getParties()){
            std::cout << "[Party: " << PartyToString(it) << "] : " << d->get_party(it) << " ";
        }
        std::cout << std::endl << std::endl;
    }
}

// Does some calculating and prints the results
void TextUI::Results(){
    ElectoralMap &m = e_->getMap();
    // Doesn't print anything if no one is registered
    if(e_->getRegistered().empty()){
        return;
    }
    std::map<int,std::map<Candidate,int>> votes = e_->Tally();
    int max = -1;
    Candidate winner;
    std::map<Candidate,int> total;
    
    for(auto &Dist: votes){
        std::cout << "District: " << Dist.first << std::endl;
        for(auto &Memb: Dist.second){
            std::cout << Memb.first.name << ": " << Memb.second << std::endl;
            if(!total.count(Memb.first)){
                total.insert(std::make_pair(Memb.first,Memb.second));
            }else{
                total[Memb.first] += Memb.second;
            }
            if(total[Memb.first] > max){
                max = Memb.second;
                winner = Memb.first;
            }
        }
    }
    std::cout << "Full results:" << std::endl;
    for(auto &Memb: total){
        std::cout << Memb.first.name << ": " << Memb.second << std::endl;
    }
    std::cout << "Congratulations, " << winner.name << ", you've won!" << std::endl;
}