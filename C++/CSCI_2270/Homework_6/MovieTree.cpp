#include "MovieTree.hpp"
#include <iostream>

using namespace std;

MovieTree::MovieTree()
{
	root = nullptr;
}

TreeNode* destructor(TreeNode *currNode)
{
	if(currNode!=NULL)
    {
    	destructor(currNode->leftChild);
        destructor(currNode->rightChild);

        LLMovieNode *currLLNode = currNode->head;
        LLMovieNode *toDelete;

        while(currLLNode)
        {
        	toDelete = currLLNode;
        	currLLNode = currLLNode->next;
        	delete toDelete;
        }
        delete currNode;
        currNode = NULL;
    }
}

MovieTree::~MovieTree()
{
	destructor(root);
}

////////////////////////////////////////////////////////////////////////////////////
// Print Tree //
////////////////////////////////////////////////////////////////////////////////////

void printLL(LLMovieNode *head)
{
	LLMovieNode *temp = head;

	while(temp)
	{
		cout << " >> " << temp->title << " " << temp->rating << endl;
		temp = temp->next;
	}
}

void printTree(TreeNode *root)
{
	if(root){
		if(root->leftChild)
			printTree(root->leftChild);
		cout << "Movies starting with letter: " << root->titleChar << endl;
		printLL(root->head);
		if(root->rightChild)
			printTree(root->rightChild);
	}
}

void MovieTree::printMovieInventory()
{
	printTree(root);
}

////////////////////////////////////////////////////////////////////////////////////
// Adding a Movie //
////////////////////////////////////////////////////////////////////////////////////

void insertLL(LLMovieNode *& head, LLMovieNode *newMovie)
 {
 	LLMovieNode *temp = head;
 	if(head->title.compare(newMovie->title) > 0){
 		newMovie->next = head;
 		head = newMovie;
 	}else{
	 	while(temp)
	 	{
	 	    if(temp->next==nullptr){
	 	        newMovie->next = temp->next;
	 			temp->next = newMovie;
	 			temp = nullptr;
	 		}else if(temp->next->title > newMovie->title){
	 			newMovie->next = temp->next;
	 			temp->next = newMovie;
	 			temp = nullptr;
	 		}else{
	 			temp = temp->next;
	 		}

	 	}
	 }
 }
 
TreeNode* insertTree(TreeNode *root,LLMovieNode *newMovie)
{
	if(root == nullptr){
		TreeNode *newTreeNode = new TreeNode();
		root = newTreeNode;
		newTreeNode->head = newMovie;
		newTreeNode->titleChar = newMovie->title[0];
		return root;
	}else if(newMovie->title[0] < root->titleChar){
		root->leftChild = insertTree(root->leftChild,newMovie);
	}else if(newMovie->title[0] > root->titleChar){
		root->rightChild = insertTree(root->rightChild,newMovie);
	}else{
		insertLL(root->head,newMovie);
		return root;
	}
}

void MovieTree::addMovie(int ranking, std::string title, int year, float rating)
{
	LLMovieNode *newMovie = new LLMovieNode(ranking,title,year,rating);
	if(!root){
		TreeNode *newNode = new TreeNode();
		newNode->head = newMovie;
		newNode->titleChar = title[0];
		root = newNode;
	}else{
		insertTree(root,newMovie);
	}
}

////////////////////////////////////////////////////////////////////////////////////
// Delete Movie //
////////////////////////////////////////////////////////////////////////////////////
void deleteLL(LLMovieNode *& head, std::string title)
{
	LLMovieNode *temp = head;
	LLMovieNode *toDelete;
	if(head->title == title){
		head = head->next;
		delete temp;
		return;
	}
	while(temp)
	{
		if(temp->next->title == title){
			toDelete = temp->next;
			temp->next = temp->next->next;
			delete toDelete;
			toDelete = nullptr;
			return;
		}else{
			temp = temp->next;
		}
	}
	cout << "Movie: " << title << " not found, cannot delete." << endl;
}

TreeNode* getMinValueNode(TreeNode *currNode)
{
    if(currNode->leftChild == nullptr){
      return currNode;
    }
    return getMinValueNode(currNode->leftChild);
}

TreeNode* deleteNode(TreeNode *currNode, std::string title, bool NodeDelete)
{
	TreeNode *sub;
	if(currNode == NULL)
	{
		return NULL;
	}
	else if(title[0] < currNode->titleChar)
	{
		currNode->leftChild = deleteNode(currNode->leftChild, title, NodeDelete);
	}
	else if(title[0] > currNode->titleChar)
	{
		currNode->rightChild = deleteNode(currNode->rightChild, title, NodeDelete);
	}
	else if(!NodeDelete)
	{
		// No child
		if(currNode->head->title == title && currNode->head->next == nullptr){
			delete currNode->head;
			if(currNode->leftChild == NULL && currNode->rightChild == NULL)
			{
				delete currNode;
				return nullptr;
			}
			//Only right child
			else if(currNode->leftChild == NULL)
			{
				sub = currNode->rightChild;
				delete currNode;
				currNode = sub;
			}
			// Only left child
			else if(currNode->rightChild == NULL)
			{
				sub = currNode->leftChild;
				delete currNode;
				currNode = sub;
			}
			// Both left and right child
			else
			{
				///Replace with Minimum from right subtree
				sub = getMinValueNode(currNode->rightChild);
				currNode->head = sub->head;
				currNode->titleChar = sub->titleChar;
				NodeDelete = true;
				sub->parent->leftChild = sub->rightChild;
				currNode->rightChild = deleteNode(currNode->rightChild, sub->head->title, NodeDelete);
			}
		}else{
			deleteLL(currNode->head,title);
		}
	}else{
		delete currNode;
		return nullptr;
	}
	return currNode;
	
}

void MovieTree::deleteMovie(std::string title)
{
    if(!root)
        cout << "Movie: " << title << " not found, cannot delete." << endl;
    else{
   	    root = deleteNode(root,title,false);
    }
}