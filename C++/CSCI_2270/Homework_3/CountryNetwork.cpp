/****************************************************************/
/*                CountryNetwork Implementation                 */
/****************************************************************/
/* TODO: Implement the member functions of class CountryNetwork */
/*     This class uses a linked-list of Country structs to      */
/*     represet communication paths between nations             */
/****************************************************************/

#include "CountryNetwork.hpp"
#include <string>

using namespace std;

/*
 * Purpose: Constructer for empty linked list
 * @param none
 * @return none
 */
CountryNetwork::CountryNetwork()
{
	head = nullptr;
}


/*
 * Purpose: Check if list is empty
 * @return true if empty; else false
 */
bool CountryNetwork::isEmpty()
{
	if(head == nullptr){
		return true;
	}else{
		return false;
	}
}


/*
 * Purpose: Add a new Country to the network
 *   between the Country *previous and the Country that follows it in the network.
 * @param previous name of the Country that comes before the new Country
 * @param countryName name of the new Country
 * @return none
 */
void CountryNetwork::insertCountry(Country* previous, string countryName)
{
	Country *temp = new Country();
	temp -> name = countryName;
	temp -> numberMessages = 0;
	if(previous == NULL){
		temp -> next = head;
		head = temp;
		cout << "adding: " << countryName << " (HEAD)" << endl;
	}else if(previous->next == NULL){
		temp -> next = NULL;
		previous -> next = temp;
		cout << "adding: " << countryName << " (prev: " << previous->name << ")" << endl;
	}else{
		temp -> next = previous -> next;
		previous -> next = temp;
		cout << "adding: " << countryName << " (prev: " << previous->name << ")" << endl;
	}
}


/*
 * Purpose: delete the country in the network with the specified name.
 * @param countryName name of the country to delete in the network
 * @return none
 */
void CountryNetwork::deleteCountry(string countryName)
{
	bool found = false;
	Country *temp = new Country();
	Country *previous = new Country();
	temp = head;
	while(temp!=NULL)
	{
		if(head->name == countryName){
			temp = head -> next;
			delete head;
			head = temp;
			return;
		}else if(temp->name == countryName){
			if(temp->next == nullptr){
				previous -> next = nullptr;
				delete temp;
				return;
			}
			previous -> next = temp -> next;
			delete temp;
			return;
		}else{
			previous = temp;
			temp = temp -> next;
		}
	}
	if(temp == NULL)
			cout << "Country does not exist." << endl;
}


/*
 * Purpose: populates the network with the predetermined countries
 * @param none
 * @return none
 */
void CountryNetwork::loadDefaultSetup()
{
	deleteEntireNetwork();
	Country *prev = NULL;
	string add;
	string prevName;
	string def[6] = {"United States","Canada","Brazil","India","China","Australia"};
	for(int i = 0; i<6; i++){
		if(i!=0){
			prevName = def[i-1];
			prev = searchNetwork(prevName);
		}
		add = def[i];
		insertCountry(prev,add);
	}
}


/*
 * Purpose: Search the network for the specified country and return a pointer to that node
 * @param countryName name of the country to look for in network
 * @return pointer to node of countryName, or NULL if not found
 * @see insertCountry, deletecountry
 */
Country* CountryNetwork::searchNetwork(string countryName)
{
	Country *temp;
	temp = head;
	if(countryName == "First")
		return NULL;
	else{
		while(temp != nullptr)
		{
			if(temp->name == countryName){
				return temp;
			}
			temp = temp -> next;
		}
	}
	return NULL;
}


/*
 * Purpose: deletes all countries in the network starting at the head country.
 * @param none
 * @return none
 */
void CountryNetwork::deleteEntireNetwork()
{
	if(isEmpty()) return;
	Country *temp;
	Country *deleter;
	temp = head;
	while(temp != nullptr)
	{
		cout << "deleting: " << temp->name << endl;
		deleter = temp;
		temp = temp -> next;
		deleteCountry(deleter->name);
	}
	cout << "Deleted network" << endl;
}


/*
 * Purpose: Transmit a message across the network to the
 *   receiver. Msg should be stored in each country it arrives
 *   at, and should increment that country's count.
 * @param receiver name of the country to receive the message
 * @param message the message to send to the receiver
 * @return none
 */
void CountryNetwork::transmitMsg(string receiver, string message)
{
	Country *temp;
	temp = head;
	if(isEmpty()){
		cout << "Empty list" << endl;
		return;
	}
	while(temp!=nullptr)
	{
		temp -> message = message;
		temp -> numberMessages++;
		cout << temp->name << " [# messages received: " << temp->numberMessages << "] received: " << temp->message << endl;
		if(temp->name == receiver)
			return;
		temp = temp -> next;
	}
}


/*
 * Purpose: prints the current list nicely
 * @param ptr head of list
 */
void CountryNetwork::printPath()
{
    Country *temp;
    temp = head;
    cout << "== CURRENT PATH ==" << endl;
    if(isEmpty())
    	cout << "nothing in path" << endl;
    else{
	    while(temp!=nullptr)
	    {
	    	cout << temp->name << " -> ";
	    	temp = temp -> next;
	    }
	    cout << "NULL" << endl;
	}
    cout << "===" << endl;
}


/*
 * Purpose: reverse the entire network t
 * @param ptr head of list
 */
void CountryNetwork::reverseEntireNetwork()
{
	Country *temp1;
	Country *temp2;
	Country *temp3;
	temp1 = head;
	if(isEmpty())
		return;
	while(temp1!=nullptr)
	{
		temp2 = temp1 -> next;
		if(temp1 == head){
			temp1 -> next = nullptr;
		}else{
			temp1 -> next = temp3;
		}
		temp3 = temp1;
		temp1 = temp2;
	}
	head = temp3;
}