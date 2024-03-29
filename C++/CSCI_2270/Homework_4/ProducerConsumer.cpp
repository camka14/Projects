#include "ProducerConsumer.hpp"
#include <iostream>
// you may include more libraries as needed

using namespace std;

ProducerConsumer::ProducerConsumer()
{
	queueFront = -1;
	queueEnd = -1;
}
bool ProducerConsumer::isEmpty()
{
	if(queueFront == -1)
		return true;
	else
		return false;
}
bool ProducerConsumer::isFull()
{
	if(queueFront == queueEnd+1 || (queueFront == 0 && queueEnd == SIZE-1))
		return true;
	else
		return false;
}
void ProducerConsumer::enqueue(std::string player)
{
	if(!isFull() && !isEmpty()){
		if(queueEnd == SIZE-1){
			queueEnd = 0;
		}else{
			queueEnd++;
		}
		queue[queueEnd] = player;
		cout<<"enqueue, "<<queue[queueEnd]<<queueEnd<<endl;
	}else if(!isFull() && isEmpty()){
		queue[0] = player;
		queueFront++;
		queueEnd++;
		cout<<"enqueue, "<<queue[queueEnd]<<queueEnd<<endl;
	}else{
		cout << "Queue full, cannot add new item" << endl;
	}
}
void ProducerConsumer::dequeue()
{
	if(!isEmpty()){
		cout<<"dequeue, "<<peek()<<queueFront<<endl;
		queue[queueFront] = "";
		if(queueFront == SIZE-1)
			queueFront = 0;
		else
			queueFront++;
	}else{
		cout << "Queue empty, cannot dequeue an item" << endl;
	}
	if(queue[queueFront] == ""){
		queueFront = -1;
		queueEnd = -1;
	}
}
int ProducerConsumer::queueSize()
{
	if(queueEnd>queueFront)
		return queueEnd - queueFront +1;
	else if(isEmpty())
		return 0;
	else
		return queueEnd+1 + SIZE - queueFront;
}
string ProducerConsumer::peek()
{
	if(!isEmpty())
		return queue[queueFront];
	else{
		cout << "Queue empty, cannot peek" << endl;
		return "";
	}
}