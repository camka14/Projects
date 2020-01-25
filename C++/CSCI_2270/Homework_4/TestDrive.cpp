
#include "ProducerConsumer.hpp"
#include <iostream>
#include <string>
// you may include more libraries as needed

using namespace std;


int main()
{
cout << "Enqueue 20 things, dequeue 10, enqeue 7" << endl;
ProducerConsumer pc;
for(int i=0; i<20; i++)
    pc.enqueue("aaa");
for(int i=0; i<10; i++)
    pc.dequeue();
for(int i=0; i<7; i++)
    pc.enqueue("bbb");
cout << "Queue front index: " << pc.getQueueFront() << endl;
cout << "Queue back index: " << pc.getQueueEnd() << endl;
cout << "Queue size: " << pc.queueSize() << endl;
for(int i=0; i<pc.queueSize();i++){
	cout <<  pc.peek() << endl;
	pc.dequeue();
}
return 0;
}