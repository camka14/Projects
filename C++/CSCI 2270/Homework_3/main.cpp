/****************************************************************/
/*                   Assignment 3 Driver File                   */
/****************************************************************/
/* TODO: Implement menu options as described in the writeup     */
/****************************************************************/

#include "CountryNetwork.hpp"
// you may include more libraries as needed

using namespace std;

void displayMenu();

int main(int argc, char* argv[])
{
	CountryNetwork net;
	Country *prevC = NULL;
	string country;
	string previous;
	string add;
	string msg;
	string choice;
	bool stop = false;
	while(!stop)
	{
		displayMenu();
		getline(cin,choice);
		switch(stoi(choice))
		{
			case 1:{
				net.loadDefaultSetup();
				net.printPath();
				break;
			}
			case 2:{
				net.printPath();
				cout<<endl;
				break;
			}
			case 3:{
				cout << "Enter name of the country to receive the message: " << endl;
				getline(cin,country);
				cout << "Enter the message to send: " << endl<<endl;
				getline(cin,msg);
				net.transmitMsg(country,msg);
				cout<<endl;
				break;
			}
			case 4:{
				cout << "Enter a new country name: " << endl;
				getline(cin,add);
				cout << "Enter the previous country name (or First): " << endl;
				do{
					getline(cin,previous);
					prevC = net.searchNetwork(previous);
					if(prevC == NULL && previous != "First")
						cout << "INVALID country...Please enter a VALID previous country name: " << endl;
				}while(prevC == NULL && previous != "First");
				cout<<endl;
				net.insertCountry(prevC,add);
				net.printPath();
				cout<<endl;
				break;
			}
			case 5:{
				cout << "Enter a country name:" << endl;
				getline(cin,country);
				net.deleteCountry(country);
				net.printPath();
				cout<<endl;
				break;
			}
			case 6:{
				net.reverseEntireNetwork();
				net.printPath();
				cout<<endl;
				break;
			}
			case 7:{
				net.deleteEntireNetwork();
				cout<<endl;
				break;
			}
			case 8:{
				cout << "Quitting... cleaning up path: " << endl;
				net.printPath();
				net.deleteEntireNetwork();
				if(net.isEmpty())
					cout << "Path cleaned" << endl;
				else
					cout << "Error: Path NOT cleaned" << endl;
				cout << "Goodbye!" << endl;
				stop = true;
				break;
			}
		}
	}
}

/*
 * Purpose: displays a menu with options
 */
void displayMenu()
{
    cout << "Select a numerical option:" << endl;
    cout << "+=====Main Menu=========+" << endl;
    cout << " 1. Build Network " << endl;
    cout << " 2. Print Network Path " << endl;
    cout << " 3. Transmit Message " << endl;
    cout << " 4. Add Country " << endl;
    cout << " 5. Delete Country " << endl;
    cout << " 6. Reverse Network" << endl;
    cout << " 7. Clear Network " << endl;
    cout << " 8. Quit " << endl;
    cout << "+-----------------------+" << endl;
    cout << "#> ";
}