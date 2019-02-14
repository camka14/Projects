#include<iostream>


using namespace std;

struct node {
	int key;
    node *next;
};

int LinkedListFindMinimum(node *head)
{
    node *temp = new node;
    temp = head;
    int val;
    while(temp!=NULL){
        if(temp == head){
            val = temp->key;
            temp = temp->next;
        }else{
         if(temp->key < val){
             val = temp->key;
         }
         temp = temp->next;
        }
    }
    return val;
};

node* reverse(node *head)
{
	node *temp1;
	node *temp2;
	node *temp3;
	temp1 = head;
	while(temp1!=nullptr)
	{
		temp2 = temp1 -> next;
		if(temp1 == head){
			temp1 -> next = nullptr;
		}else{
			temp1 -> next = temp3;
		}
		temp3 = temp1;
		temp1 = temp2;
	}
	head = temp3;
	return head;
}

int main(){
	node *n1 = new node;
	node *n2 = new node;
	node *n3 = new node;
	node *n4 = new node;
	node *n5 = new node;
	node *n6 = new node;

	n1->key = 9876;
	n1->next = n2;
	n2->key = 3;
	n2->next = n3;
	n3->key = 1000;
	n3->next = n4;
	n4->key = 100;
	n4->next = n5;
	n5->key = 3;
	n5->next = n6;
	n6->key = 9;
	n6->next = NULL;
	node *temp = reverse(n1);
	while(temp!=NULL){
		cout << temp->key << endl;
		temp = temp->next;
	}
	return 0;
}