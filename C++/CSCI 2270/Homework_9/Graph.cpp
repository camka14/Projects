#include "Graph.hpp"

using namespace std;


void Graph::addVertex(std::string cityName)
{
	vertex *newV = new vertex();
	newV->name = cityName;
	newV->visited = false;
	vertices.push_back(*newV);
}

void Graph::addEdge(std::string city1, std::string city2, int distance)
{
	vertex *temp1 = findVertex(city1);
	vertex *temp2 = findVertex(city2);
	Edge *newE = new Edge();

	newE->v = temp2;
	newE->distance = distance;

	temp1.Edges.push_back(*newE)
}

void Graph::displayEdges()
{
	for(std::vector<T>::iterator it1 = vertices.begin(); it1 != vertices.end(); ++it1){
		cout << *it1.name << "-->";
    	for(std::vector<T>::iterator it2 = *it1.Edges.begin(); it2 != *it1.Edges.end(); ++it1){
    		if(*it2!=it1.Edges.end())
	    		cout << *it2.v.name << " ("  << *it2.distance << " miles)***";
	    	else
	    		cout << *it2.v.name << " ("  << *it2.distance << " miles)" << endl;
    	}
    }
}

void Graph::printDFT()
{

}

void Graph::printBFT()
{

}

void Graph::setAllVerticesUnvisited()
{

}

vertex *Graph::findVertex(std::string name)
{

}

void Graph::BFT_traversal(vertex *v)
{

}

void Graph::DFT_traversal(vertex *v)
{

}