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

void splitList(Node *head);
void add(Node *& head,Node *newbie);
void print(Node *head);

int main()
{
	cout << "First:" << endl;
	Node *n1 = new Node(7);
	Node *n2 = new Node(3); n1->next = n2;
	Node *n3 = new Node(6); n2->next = n3;
	Node *n4 = new Node(2); n3->next = n4;
	Node *n5 = new Node(17); n4->next = n5;
	Node *n6 = new Node(23); n5->next = n6;
	Node *n7 = new Node(75); n6->next = n7;
	splitList(n1);
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
	splitList(n1);

	cout<<endl;

	cout << "Third:" << endl;
	n1 = nullptr;
	delete n2,n3;
	splitList(n1);

	return 0;
}

void splitList(Node *head)
{
	Node *temp = head;
	Node *temp2;
	Node *prevO;
	Node *prevE;
	Node *headE = nullptr;
	Node *headO = nullptr;

	while(temp)
	{
		if(temp->num%2 == 0){
			if(headE == nullptr){
				headE = temp;
			}else{
				prevE->next = temp;
			}
			prevE = temp;
		}else{
			if(headO == nullptr){
				headO = temp;
			}else{
				prevO->next = temp;
			}
			prevO = temp;
		}
		temp2 = temp->next;
		temp->next = nullptr;
		temp = temp2;
	}

	cout << "Odd:" << endl;
	print(headO);

	cout << "Even:"<< endl;
	print(headE);
}


void print(Node *head)
{
	Node *temp = head;
	while(temp)
	{
		cout << temp->num << endl;
		temp = temp->next;
	}
}