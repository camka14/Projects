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

void deleteNegatives(Node *& head);
void print(Node *head);

int main()
{
	Node *n1 = new Node(2);
	Node *n2 = new Node(-3); n1->next = n2;
	Node *n3 = new Node(4); n2->next = n3;
	Node *n4 = new Node(-5); n3->next = n4;
	Node *n5 = new Node(6); n4->next = n5;
	Node *head = n1;
	print(head);
	cout << head->num << endl;
	deleteNegatives(head);
	cout << head->num << endl;
	print(head);
	return 0;
}

void deleteNegatives(Node *& head)
{
	if(!head) return;
	while(head and head->num < 0){
		Node *temp = head->next;
		delete head;
		head = temp;
	}
	Node *temp = head;
	while(temp)
	{
		if(temp->next->num < 0){
			Node *temp2 = temp->next->next;
			delete temp->next;
			temp->next = temp2;
			temp = temp2;
		}else
			temp = temp->next;
	}
}

void print(Node *head)
{
	Node *temp = head;
	while(temp){
		cout << temp->num << endl;
		temp = temp->next;
	}
	cout << "Null" << endl;
}