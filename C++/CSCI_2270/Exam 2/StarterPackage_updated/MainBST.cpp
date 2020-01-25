#include "BST.hpp"
#include <iostream>

using namespace std;

int main()
{
	BST tree1;
	BST tree2;
	BST tree3;

	tree1.addNode(4);
	tree1.addNode(2);
	tree1.addNode(7);

	tree2.addNode(9);
	tree2.addNode(7);
	tree2.addNode(16);
	tree2.addNode(4);
	tree2.addNode(8);
	tree2.addNode(11);

	tree3.addNode(-3);
	tree3.addNode(1000);
	tree3.addNode(-23);
	tree3.addNode(-500);
	tree3.addNode(42);
	tree3.addNode(11);


	cout << tree1.sumRange(8,12);
	cout << endl;
	cout << tree2.sumRange(8,12);
	cout << endl;
	cout << tree3.sumRange(-500,50);
}