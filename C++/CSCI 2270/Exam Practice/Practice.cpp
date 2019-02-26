#include "Practice.hpp"

using namespace std;

LList::LList()
{
    head = NULL;
}

bool LList::lengthIsEven()
{
    Node *temp = head;
    int count = 0;

    while(temp!=NULL)
        count++;
    if(count%2 == 0)
        return true;
    else
        return false;
}

void LList::insert(int num)
{
    Node *temp = new Node();
    Node *previous = head;
    temp -> num = num;
    if(previous == NULL){
        temp = head;
        head = temp;
        return;
    }

    while(previous->next!=NULL)
    {
        previous = previous->next;
    }
    temp -> next = NULL;
    previous -> next = temp;
}
void LList::remove(int num)
{
    bool found = false;
    Node *temp = new Node();
    Node *previous = new Node();
    temp = head;
    while(temp!=NULL)
    {
        if(head->num == num){
            temp = head -> next;
            delete head;
            head = temp;
            return;
        }else if(temp->num == num){
            if(temp->next == nullptr){
                previous -> next = nullptr;
                delete temp;
                return;
            }
            previous -> next = temp -> next;
            delete temp;
            return;
        }else{
            previous = temp;
            temp = temp -> next;
        }
    }
    if(temp == NULL)
            cout << "input does not exist." << endl;
}