#include<iostream>
#include<fstream>
#include<string>

using namespace std;

// Word Pair Struct
struct UniqueWordPair
{
	string word1;
	string word2;
	int noOccurances = 0;
};

void sortArray(struct UniqueWordPair arr[], int N);

int main()
{
	// Variable Initialization
	ifstream text;
	int N = 50000;
	int count = 0;
	int index;
	UniqueWordPair UniqueWordPairArr[N];
	string prev;
	string pair;
	string word;
	text.open("cleanedText.txt");
	while(text >> word)
	{
		//First Step
		if(count == 0){
			prev = word;
			count++;
		}
		// After First Step
		else{
		bool isUnique = true;
		
		// Checks if pair is in the array
		for(int i = 0; i < N; i++)
		{
			if(prev == UniqueWordPairArr[i].word1 && word == UniqueWordPairArr[i].word2)
			{
				isUnique = false; // Sets the flag to false
				index = i;        // Sets the index for the array location
				continue;		  // Skips the rest of the pairs
			}
		}
		if(isUnique == true)
		{
			UniqueWordPairArr[count].word1 = prev; // Creates new variable in the struct
			UniqueWordPairArr[count].word2 = word;
			UniqueWordPairArr[count].noOccurances = 1;
			count++;
		}
		else
			UniqueWordPairArr[index].noOccurances++; // Counts repetitions
		prev = word; // Sets current word as previous word
		}
	}
	
	sortArray(UniqueWordPairArr,count);
	
	cout << "The number of unique pairs is " << count << endl;
	cout << "\nThe 10 most common pairs are:" << endl;
	
	// Prints out 10 most common and 10 least common combinations
	for(int i = count-1; i > 0; i--)
	{
		if(i >= count - 10)
		{
			cout << UniqueWordPairArr[i].word1<< " " << UniqueWordPairArr[i].word2
			<< " " << UniqueWordPairArr[i].noOccurances << endl;
		}
		if(i == 9)
			cout << "\nThe 10 least common pairs are:" << endl;
		if(i < 10)
		{
			cout << UniqueWordPairArr[i].word1<< " " << UniqueWordPairArr[i].word2
			<< " " << UniqueWordPairArr[i].noOccurances << endl;
		}
	}
	text.close();
	return 0;
}

// Modified sort array function
void sortArray(struct UniqueWordPair arr[], int N)
{
	UniqueWordPair temp;
	for(int i = N-1; i>0; i--)
	{
		for(int j = 0; j < i; j++){
			if(arr[j].noOccurances>arr[j+1].noOccurances){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
}