#include <iostream>
#include <ctime>

using namespace std;

// Initializing functions
void randArrays(int arrA[], int arrB[], int N);
void sortArr(int arr[], int N, bool A);

int main()
{
	
	int N = 10;
	int arrayA[N];
	int arrayB[N];
	randArrays(arrayA, arrayB, N);
	sortArr(arrayA, N, true);
	sortArr(arrayB, N, false);
	for(int i = 0; i < N; i++){
		cout << arrayA[i] << "," << arrayB[i] << endl;  // Prints out the arrays
	}
	return 0;

}

void randArrays(int arrA[], int arrB[], int N)
{
	for(int i = 0; i < N; i++)
	{
		arrA[i] = N-i;
		arrB[i] = i; // Sets values from i to the arrays
	}
}

void sortArr(int arr[], int N, bool A)
{
	int temp;
	cout << A << endl;
	if(A == 1)
	{ // Sorts in ascending order
		for(int i = N-1; i>0; i--)
		{
			for(int j = 0; j < i; j++){
				if(arr[j]>arr[j+1]){
					cout << "sort increase" << endl; // Temporary output
				}
			}
		}
	}
	else
	{ // Sorts in descending order
		for(int i = 0; i<N; i++)
		{
			for(int j = N-1; j > i; j--){
				if(arr[j]>arr[j-1]){
					cout << "sort decrease" << endl; // Temporary output
				}
			}
		}
	}
}