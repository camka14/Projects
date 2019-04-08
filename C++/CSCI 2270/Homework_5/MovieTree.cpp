#include "MovieTree.hpp"
#include <iostream>

using namespace std;

MovieTree::MovieTree()
{
	root = nullptr;
}

MovieTree::~MovieTree()
{

}

void printTree(MovieNode *root)
{
	if(root){
		if(root->leftChild)
			printTree(root->leftChild);
		cout << "Movie: " << root->title << " " << root->rating << endl;
		if(root->rightChild)
			printTree(root->rightChild);
	}
}

void MovieTree::printMovieInventory()
{
	MovieNode *temp = root;

	printTree(temp);
}

MovieNode* insert(MovieNode *head, MovieNode *node)
{
	if(head == nullptr){
		head = node;
		return head;
	}else if(node->title < head->title){
		head->leftChild = insert(head->leftChild,node);
	}else{
		head->rightChild = insert(head->rightChild,node);
	}
}

void MovieTree::addMovieNode(int ranking, std::string title, int year, float rating)
{
	MovieNode *newNode = new MovieNode(ranking,title,year,rating);
	if(root == nullptr)
		root = newNode;
	else
		insert(root,newNode);
}

void MovieTree::findMovie(std::string title)
{
	MovieNode *temp;

	temp = search(title);
	if(!temp)
		cout << "Movie not found." << endl;
	else
	{
		cout <<"Movie Info:"<< endl;
		cout <<"=================="<< endl;
		cout <<"Ranking:"<< temp->ranking << endl;
		cout <<"Title  :"<< temp->title << endl;
		cout <<"Year   :"<< temp->year << endl;
		cout <<"rating :"<< temp->rating << endl;
	}
}

MovieNode *searchRecur(MovieNode *root,std::string title)
{
	if(root == nullptr)
		return root;
	if(root->title == title)
		return root;
	else if(root->title > title)
		root = searchRecur(root->leftChild,title);
	else
		root = searchRecur(root->rightChild,title);
	return root;
}

MovieNode *MovieTree::search(std::string title)
{
	MovieNode *temp;
	temp = searchRecur(root,title);
	return temp;
}

void printQuery(MovieNode *root, float rating, int year)
{
	if(root){
		if(root->rating >= rating && root->year > year)
			cout << root->title << "(" << root->year << ") " << root->rating << endl;
		if(root->leftChild)
			printQuery(root->leftChild,rating,year);
		if(root->rightChild)
			printQuery(root->rightChild,rating,year);
	}
}


void MovieTree::queryMovies(float rating, int year)
{
	cout << "Movies that came out after " << year << " with rating at least " << rating << ":" << endl;
	printQuery(root,rating,year);

}

void averageRecur(MovieNode *root, int & count, float & rating)
{
	if(root){
		count++;
		rating += root->rating;
		if(root->leftChild){
			averageRecur(root->leftChild,count,rating);
		}
		if(root->rightChild)
			averageRecur(root->rightChild,count,rating);
	}
}

void MovieTree::averageRating()
{
	int count = 0;
	float rating = 0;
	float average;
	averageRecur(root,count,rating);
	if(count != 0){
		float average = rating/count;
		cout << "Average rating:" << average << endl;
		}
	else{
	    average = 0;
	    cout << "Average rating:" << average << endl;
	    }
}