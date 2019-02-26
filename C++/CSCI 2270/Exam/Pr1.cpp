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

int sumEvens(Node *head);

int main()
{
	cout << "First:" << endl;
	Node *n1 = new Node(7);
	Node *n2 = new Node(3); n1->next = n2;
	Node *n3 = new Node(6); n2->next = n3;
	Node *n4 = new Node(2); n3->next = n4;
	Node *n5 = new Node(17); n4->next = n5;
	Node *n6 = new Node(22); n5->next = n6;
	Node *n7 = new Node(76); n6->next = n7;
	cout << "Input: 7->3->6->2->17->22->76" << endl;
	cout << "Output: " << sumEvens(n1) << endl;
	cout<<endl;

	cout << "Second:" << endl;
	n1->num = 3;
	n2->num = 9;n1->next = n2;
	n3->num = 4;n2->next = n3;
	n4->num = 2;n3->next = n4;
	n5->num = 8;n4->next = n5;
	n6->num = 5;n5->next = n6;
	n6->next = nullptr;
	delete n7;
	cout << "Input: 3->9->4->2->8->5" << endl;
	cout << "Output: " << sumEvens(n1) << endl;

	cout<<endl;

	cout << "Third:" << endl;
	n1 = nullptr;
	delete n2,n3;
	
	cout << "Input: NULL" << endl;
	cout << "Output: " << sumEvens(n1) << endl;

	return 0;
}

int sumEvens(Node *head)
{
	if(!head) return 0;
	Node *temp = head;
	int sum = 0;

	while(temp)
	{
		if(temp->num%2 == 0)
			sum += temp->num;
		temp = temp->next;
	}
	return sum;
}