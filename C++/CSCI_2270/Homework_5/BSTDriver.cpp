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

	while (getline(file, stringLine))
	{
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
		cout << "====== Main Menu=====" << endl;
		cout << "1. Find a movie" << endl;
		cout << "2. Query Movies" << endl;
		cout << "3. Print the inventory" << endl;
		cout << "4. Average Rating of movies" << endl;
		cout << "5. Quit" << endl;

		getline(cin, input);

		switch(stoi(input)){
			case 1:
				string title;
				cout <<"Enter title:" << endl;
				getline(cin, title);
				tree.findMovie(title);
				break;
			case 2:
				string rating;
				string year;
				cout << "Enter a minimum rating" << endl;
				getline(cin, rating);
				cout << "Enter a minimum year" << endl;
				getline(cin, year);
				tree.queryMovies(stof(rating),stoi(year));
				break;
			case 3:
				tree.printMovieInventory();
				break;
			case 4:
				tree.averageRating();
				break;
			case 5:
				break;
		}
	}
	while(stoi(input) != 5);
	return 0;
}