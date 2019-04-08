#include "PriorityQueue.hpp"
#include <iostream>

using namespace std;


PriorityQueue::PriorityQueue(int queueSize)
{
	maxQueueSize = queueSize;
	currentQueueSize = 0;
	priorityQueue = new GroupNode[queueSize];
}

PriorityQueue::~PriorityQueue()
{
    delete[] priorityQueue;
    priorityQueue = 0;
}

void PriorityQueue::enqueue (std::string _groupName, int _groupSize, int _cookingTime)
{
	GroupNode newNode;
	newNode.groupName = _groupName;
	newNode.groupSize = _groupSize;
	newNode.cookingTime = _cookingTime;

	if(!isFull()){
		priorityQueue[currentQueueSize] = newNode;
		repairUpward(currentQueueSize);
		currentQueueSize++;
	}else{
		cout << "Heap full, cannot enqueue" << endl;
	}
}

void PriorityQueue::dequeue()
{
	if(!isEmpty()){
		priorityQueue[0] = priorityQueue[currentQueueSize-1];
		repairDownward(0);
		currentQueueSize--;
	}
	else
		cout << "Heap empty, cannot dequeue" << endl;
}

GroupNode PriorityQueue::peek()
{
	return priorityQueue[0];
}

bool PriorityQueue::isFull()
{
	if(currentQueueSize == maxQueueSize)
		return true;
	return false;
}

bool PriorityQueue::isEmpty()
{
	if(currentQueueSize == 0)
		return true;
	return false;
}

void swap(GroupNode *a, GroupNode *b)
{
	GroupNode temp = *a;
	*a = *b;
	*b = temp;
}

int parent(int index)
{
	return (index-1)/2;
}

int leftChild(int index)
{
	return ((2*index) + 1);
}

int rightChild(int index)
{
	return ((2*index) + 2);
}

void PriorityQueue::repairUpward(int nodeIndex)
{
	int p = parent(nodeIndex);
	if(p >= 0 && priorityQueue[p].groupSize > priorityQueue[nodeIndex].groupSize){
		swap(priorityQueue[nodeIndex],priorityQueue[p]);
		repairUpward(p);
	}else if(p >= 0 && priorityQueue[p].groupSize == priorityQueue[nodeIndex].groupSize && priorityQueue[p].cookingTime > priorityQueue[nodeIndex].cookingTime){
		swap(priorityQueue[nodeIndex],priorityQueue[p]);
		repairUpward(p);
	}
}

void PriorityQueue::repairDownward(int nodeIndex)
{
	int l = leftChild(nodeIndex);
	int r = rightChild(nodeIndex);
	int smallest = nodeIndex;

	if(l < currentQueueSize && priorityQueue[l].groupSize <= priorityQueue[smallest].groupSize){
	    if(priorityQueue[l].groupSize == priorityQueue[smallest].groupSize && priorityQueue[l].cookingTime < priorityQueue[smallest].cookingTime)
            smallest = l;
        else if(priorityQueue[l].groupSize != priorityQueue[smallest].groupSize)
            smallest = l;
    }
	if(r < currentQueueSize && priorityQueue[r].groupSize <= priorityQueue[smallest].groupSize){
	    if(priorityQueue[r].groupSize == priorityQueue[smallest].groupSize && priorityQueue[r].cookingTime < priorityQueue[smallest].cookingTime)
    	    smallest = r;
        else if(priorityQueue[r].groupSize != priorityQueue[smallest].groupSize)
            smallest = r;
    }
	if(smallest != nodeIndex){
		swap(priorityQueue[nodeIndex], priorityQueue[smallest]);
		repairDownward(smallest);
	}
}