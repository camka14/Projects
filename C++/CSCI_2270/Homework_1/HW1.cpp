#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int insertIntoSortedArray (int myArray[], int numEntries, int newValue);
void sortArr(int arr[], int N);
void swap2(int arr[], int j);


int main(int argc, char const *argv[])
{
	int N = 100;
	int arr[N] = {0};
	int entries = 0;
	string num;
	ifstream inFile;
	inFile.open(argv[1]);

	if(inFile.is_open()){
		while(getline(inFile, num,'\n')){
			bool first = true;
			entries = insertIntoSortedArray(arr, entries, stoi(num));
			for(int i = 0; i<entries; i++){
				if(first == true){
					cout << arr[i];
					first = false;
				}
				else
					cout << ", " << arr[i];
			}
			cout << endl;
		}
	}else{
		cout << "Failed to open the file." << endl;
	}

	inFile.close();
	return 0;
}

int insertIntoSortedArray(int myArray[], int numEntries, int newValue)
{
	int N = numEntries+1;
	myArray[N-1] = newValue;
	int temp;
	for(int i = N-1; i>0; i--)
	{
		for(int j = 0; j < i; j++){
			if(myArray[j]>myArray[j+1]){
					int temp;
					temp = myArray[j];
					myArray[j] = myArray[j+1];
					myArray[j+1] = temp;
			}
		}
	}
	return N;
}