#include <iostream>
#include<iostream>
#include <string>

using namespace std;

struct Node
{
    int num;
    Node *next = nullptr;
    Node(){}
    Node(int n) : num(n){}
};

bool lengthIsEven(Node *head);

int main()
{
	Node *n1 = new Node(2);
	Node *n2 = new Node(3); n1->next = n2;
	Node *n3 = new Node(4); n2->next = n3;
	Node *n4 = new Node(5); n3->next = n4;
	Node *n5 = new Node(6); n4->next = n5;

	string isEven = lengthIsEven(n1) ? "true" : "false";

	cout << "List has even number of elts" << isEven << endl;

	return 0;
}

bool lengthIsEven(Node *head)
{
	if(!head) return true;
	Node *temp = head;
	int count = 0;

	while(temp)
	{
		temp = temp->next;
		count++;
	}
	if(count%2 == 0) return true;
	else return false;
}