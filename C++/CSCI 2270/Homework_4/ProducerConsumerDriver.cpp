/****************************************************************/
/*                Producer Consumer Driver File                 */
/****************************************************************/
/* TODO: Implement menu options as described in the writeup     */
/****************************************************************/

#include "ProducerConsumer.hpp"
#include <iostream>
#include <string>
// you may include more libraries as needed

using namespace std;

/*
 * Purpose: displays a menu with options
 * @param none
 * @return none
 */
void menu()
{
	cout << "*----------------------------------------*" << endl;
	cout << "Choose an option:" << endl;
    cout << "1. Producer (Produce items into the queue)" << endl;
	cout << "2. Consumer (Consume items from the queue)" << endl;
	cout << "3. Return the queue size and exit" << endl;
	cout << "*----------------------------------------*" << endl;
}

int main(int argc, char const *argv[])
{
	string input;
	int in = 0;
	int out;
	string num;
	string item;
	ProducerConsumer prod;
	while(in != 3)
	{
		menu();
		getline(cin,input);
		in = stoi(input);
		switch(in)
		{
			case 1:
				cout << "Enter the number of items to be produced: " << endl;
				getline(cin,num);
				for(int i=1; i<=stoi(num); i++){
					cout << "Item" << i << ":" << endl;
					getline(cin, item);
					prod.enqueue(item);
				}
				break;
			case 2:
				cout << "Enter the number of items to be consumed: " << endl;
				getline(cin,num);
				for(int i=1; i<=stoi(num); i++){
					if(prod.isEmpty()){
						cout << "No more items to consume from queue" << endl;
						break;
					}
					cout << "Consumed: " << prod.peek() << endl;
					prod.dequeue();
				}
				break;
			case 3:
				out = prod.queueSize();
				cout << "Number of items in the queue:" << out << endl;
				break;
		}
	}
	return 0;
}
