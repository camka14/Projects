#include "MovieTree.hpp"
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

int main(int argc, char const *argv[])
{
	MovieTree tree;
	string stringLine;
	string input;
	
	ifstream file;
	file.open(argv[1]);

	for(int i=0;i<6;i++)
	{
	getline(file, stringLine);
	stringstream sin(stringLine);

	string rank, title, year, rating;

	getline(sin, rank, ',');
	getline(sin, title, ',');
	getline(sin, year, ',');
	getline(sin, rating, ',');
	tree.addMovie(stoi(rank),title,stoi(year),stof(rating));
	}

	do
	{
		cout << "======Main Menu======" << endl;
		cout << "1. Print the inventory" << endl;
		cout << "2. Delete a movie" << endl;
		cout << "3. Quit" << endl;

		string title;

		getline(cin, input);

		switch(stoi(input)){
			case 1:
				tree.printMovieInventory();
				break;
			case 2:
				cout << "Enter a movie title: " << endl;
				getline(cin,title);
				tree.deleteMovie(title);
				break;
			case 3:
				cout << "Goodbye!" << endl;
				break;
		}
	}
	while(stoi(input) != 3);
	return 0;
}