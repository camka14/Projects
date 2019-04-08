#include "PriorityQueue.hpp"
#include <fstream>
#include <sstream>
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
	string input;
	string filename;
	string name;
	string size;
	string time;
	int totalCookTime = 0;
	PriorityQueue queue(stoi(argv[1]));

	int maxSize = stoi(argv[1]);
	do{
		cout << "============Main Menu============" << endl;
		cout << "1. Get group information from file" << endl;
		cout << "2. Add a group to Priority Queue" << endl;
		cout << "3. Show next group in the queue" << endl;
		cout << "4. Serve Next group" << endl;
		cout << "5. Serve Entire Queue" << endl;
		cout << "6. Quit" << endl;

		getline(cin,input);

		switch(stoi(input)){
			case 1:
				{
					cout << "Enter filename:" << endl;
					getline(cin,filename);
					ifstream file;
					file.open(filename);
					while(getline(file,name))
					{
						getline(file,size);
						getline(file,time);
						queue.enqueue(name,stoi(size),stoi(time));
					}
					file.close();
				}
				break;
			case 2:
				{
					cout << "Enter Group Name:" << endl;
					getline(cin,name);
					cout << "Enter Group Size:" << endl;
					getline(cin,size);
					cout << "Enter Estimated Cooking Time:" << endl;
					getline(cin,time);
					queue.enqueue(name,stoi(size),stoi(time));
				}
				break;
			case 3:
				{
					cout << "Group Name: " << queue.peek().groupName << endl;
					cout << "Group Size: " << queue.peek().groupSize << endl;
					cout << "Group Time: " << queue.peek().cookingTime << endl;
				}
				break;
			case 4:
				{
					totalCookTime += queue.peek().cookingTime;
					cout << "Group Name: " << queue.peek().groupName
					<< " - Total Cook Time for the Group: "
					<< totalCookTime << endl;
					queue.dequeue();
				}
				break;
			case 5:
				{
					while(!queue.isEmpty())
					{
						totalCookTime += queue.peek().cookingTime;
						cout << "Group Name: " << queue.peek().groupName
						<< " - Total Cook Time for the Group: "
						<< totalCookTime << endl;
						queue.dequeue();
					}
				}
				break;
			case 6:
				{
					cout << "Goodbye!" << endl;
				}
				break;
		}
	}while(stoi(input) != 6);
}