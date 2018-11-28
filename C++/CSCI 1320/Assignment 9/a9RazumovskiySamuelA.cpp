#include <iostream>
#include <ctime>

using namespace std;

// Initializing functions
void randArrays(int arrA[], int arrB[], int N);

int main()
{
	
	int N = 10;
	int arrayA[N];
	int arrayB[N];
	randArrays(arrayA, arrayB, N);
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