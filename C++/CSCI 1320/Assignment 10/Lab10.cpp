#include<iostream>
#include<fstream>
#include<string>

using namespace std;

void sortArr(int arrI[], string arrS[], int N);

int main()
{
	int count = 0;
	int N = 17;
	int ArrayI[N];
	string ArrayS[N];
	string s;
	ifstream inputString;
	inputString.open("lab10test.txt");
	while(inputString >> s)
	{
		int sum = 0;
		for(int i=0; i < s.size(); i++) // Finds the sum of each word
		{
			sum += int(s[i]);
		}
		ArrayI[count] = sum; // Stores the sum of each words letters
		ArrayS[count] = s; // Stores each word
		count ++;
	}
	sortArr(ArrayI,ArrayS,N); // Sorts both arrays by the sum of the words
	for(int i =0; i < N; i++)
		cout << ArrayS[i] << ", " << ArrayI[i] << endl;
	inputString.close();
	
	return 0;
}


void sortArr(int arrI[], string arrS[], int N)
{
	for(int i = N-1; i>0; i--)
		{
			string tempS;
			int tempI;
			for(int j = 0; j < i; j++){
				if(arrI[j]>arrI[j+1]){ // Checks the values and then sorts both arrays
					tempS = arrS[j];
					arrS[j] = arrS[j+1];
					arrS[j+1] = tempS;
					
					tempI = arrI[j];
					arrI[j] = arrI[j+1];
					arrI[j+1] = tempI;
				}
			}
		}
}