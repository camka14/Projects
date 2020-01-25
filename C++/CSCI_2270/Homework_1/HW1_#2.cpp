#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

struct User{
	string username;
	float gpa;
	int age;
};

void addUser(User users[], string _username, float _gpa, int _age, int length);

void printList(const User users[], int length);

int main(int argc, char const *argv[])
{
	ifstream inFile;
	ofstream outFile;
	int N = 100;
	int lines = 0;
	User userArr[N];
	string stringLine;

	float minGPA = stof(argv[3]);

	inFile.open(argv[1]);
	outFile.open(argv[2]);

	while (getline(inFile, stringLine,'\r'))
	{
		stringstream sin(stringLine);

		string name, gpa, age;

		getline(sin, name, ',');
		getline(sin, gpa, ',');
		getline(sin, age);
		addUser(userArr,name,stof(gpa),stoi(age),lines);
		lines++;
	}
	for(int i = 0; i<lines; i++){
		if(userArr[i].gpa > minGPA)
			outFile << userArr[i].username << "," << userArr[i].gpa << "," << userArr[i].age << endl;
	}
	printList(userArr, lines);
	inFile.close();
	outFile.close();

	return 0;
}

void addUser(User users[], string _username, float _gpa, int _age, int length)
{
	// cout << _gpa << endl;
	users[length].username = _username;
	users[length].gpa = _gpa;
	users[length].age = _age;
}

void printList(const User users[], int length)
{
	for(int i = 0; i < length; i++)
	{
		cout << users[i].username << " [" << users[i].gpa << "] age: " <<users[i].age << endl;
	}
}