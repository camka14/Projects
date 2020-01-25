#pragma once
#include <iostream>

using namespace std;

struct Node
{
    int num;
    Node *next;
};

// class for storing and manipulating linked-list of countries
class LList {
    private:
        // pointer to head of linked-list of countries
        Node* head;
    public:
    	LList();
    	bool lengthIsEven();
        void insert(int num);
        void remove(int num);
};