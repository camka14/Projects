#include "heaps.hpp"

using namespace std;

int main()
{
	Heap h(5);
	float arr1[] = {1.2,10.5,5,15,20.7};
	float arr2[] = {7,200,-4.5,99,0};
	h.heapSort(arr1,5);
	h.heapSort(arr2,5);

	for(int i=0; i<5; i++)
		cout << arr1[i] << endl;
	cout<<endl;
	for(int i=0; i<5; i++)
		cout << arr2[i] << endl;
}