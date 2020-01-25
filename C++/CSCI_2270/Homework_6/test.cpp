#include <iostream>
#include "MovieTree.hpp"
using namespace std;

int main()
{
	MovieTree tree;
	int ranking = 12;
	std::string title = "test";
	int year = 2002;
	float rating = 5.5;
	tree.addMovie(ranking,title,year,rating);

	ranking = 13;
	title = "tt";
	year = 2002;
	rating = 5.5;
	tree.addMovie(ranking,title,year,rating);

	ranking = 23;
	title = "ttr";
	year = 2002;
	rating = 5.5;
	tree.addMovie(ranking,title,year,rating);

	tree.printMovieInventory();
}