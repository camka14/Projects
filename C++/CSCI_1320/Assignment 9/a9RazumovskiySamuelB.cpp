#include <iostream>
#include <ctime>

using namespace std;

// Initializing functions
void randArrays(int arrA[], int arrB[], int N);
void sortArr(int arr[], int N, bool A);
void swap2(int arr[], int j, bool A);

int main()
{
	
	int N = 10;
	int arrayA[N];
	int arrayB[N];
	randArrays(arrayA, arrayB, N);
	sortArr(arrayA, N, true);
	sortArr(arrayB, N, false);
	for(int i = 0; i < N; i++){
		cout << arrayA[i] << "," << arrayB[i] << endl; // Prints out the arrays
	}
	return 0;

}

void randArrays(int arrA[], int arrB[], int N)
{
	srand(time(NULL));
	for(int i = 0; i < N; i++)
	{
		arrA[i] = rand()%1000;
		arrB[i] = rand()%1000; // Inputs random values into arrays
	}
}

void sortArr(int arr[], int N, bool A)
{
	int temp;
	if(A == true)
	{ // Sorts in ascending order
		for(int i = N-1; i>0; i--)
		{
			for(int j = 0; j < i; j++){
				if(arr[j]>arr[j+1]){
					swap2(arr,j,A);
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
					swap2(arr,j,A);
				}
			}
		}
	}
}

void swap2(int arr[], int j, bool A)
{
	int temp;
	if(A == true)
	{ // Swaps in acsending order
		temp = arr[j];
		arr[j] = arr[j+1];
		arr[j+1] = temp;
	}
	else
	{ // Swaps in decsending order
		temp = arr[j];
		arr[j] = arr[j-1];
		arr[j-1] = temp;
	}
}