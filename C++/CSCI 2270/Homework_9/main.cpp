#include "Graph.hpp"
#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

int main(int argc, char const *argv[])
{
	ifstream file;
	Graph g;
	string stringLine;
	vector<string> cities;
	int count=0;
	file.open(argv[1]);

	string city;
	string distance;

	getline(file, stringLine,'\n');
	stringstream sin(stringLine);
	getline(sin,city,',');
	while(getline(sin,city,',')){
		g.addVertex(city);
		count++;
		cities.push_back(city);
	}

	while(getline(file, stringLine,'\n'))
	{
		stringstream sin(stringLine);
		getline(sin, city, ',');

		for(int i=0; i<count; i++)
		{
			getline(sin, distance, ',');
			if(stoi(distance) > 0){
				g.addEdge(city,cities[i],stoi(distance));
				cout << " ... Reading in " << city << " -- " << cities[i] << " -- " << distance << endl;
			}
		}
	}
	file.close();
	cout << "------------------------------ " << endl << "Breadth First Traversal" << endl << "------------------------------" << endl;
	g.printBFT();
	cout << "------------------------------ " << endl << "Depth First Traversal" << endl << "------------------------------" << endl;
	g.printDFT();
	cout << "------------------------------ " << endl << "Display Edges" << endl << "------------------------------" << endl;
	g.displayEdges();
}