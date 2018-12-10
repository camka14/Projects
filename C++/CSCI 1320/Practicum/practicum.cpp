#include <iostream>
#include <cmath>

using namespace std;

void finalPrac(int arr[], int aSize, int &x);

int main()
{
	// Initializing all arrays, sizes, and variables x
	int arr1[9] = {4,8,1,5,8,3,1,8,3};
	int aSize1 = 9;
	int x1 = 8;
	int arr2[8] = {2,2,7,0,1,9,8,5};
	int aSize2 = 8;
	int x2 = 2;
	int arr3[5] = {4,1,5,4,8};
	int aSize3 = 5;
	int x3 = 4;
	
	// Calling function for each array test
	finalPrac(arr1,aSize1,x1);
	finalPrac(arr2,aSize2,x2);
	finalPrac(arr3,aSize3,x3);
	
	return 0;
}

void finalPrac(int arr[], int aSize, int &x){
	// Initializing count and starting print
	int count = 0;
	cout << "arr = {";
	for(int i = 0; i < aSize; i++){
		if(arr[i] == x){ // Checks if value is equal to x
			arr[i] = pow(arr[i],3); // Cubes the value
			count++; // Increments count
		}
		if(i == aSize-1) // Checks if last value of array
			cout << arr[i] << "} and "; // Prints last value
		else
			cout << arr[i] << ","; // Prints all other values
	}
	x = count; // Replaces value of x
	cout << "x = " << x << endl; // Prints out x
}