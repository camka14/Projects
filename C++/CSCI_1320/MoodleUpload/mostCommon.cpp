#include<iostream>
#include<fstream>
#include<string>

using namespace std;

// Unique Words Struct
struct UniqueWords
{
	string word;
	int noOccurances = 0;
};

void sortArray(struct UniqueWords arr[], int N);

int main()
{
	// Variable Initialization
	ifstream text;
	int N = 8000;
	UniqueWords UniqueWordArr[N];
	int count = 0;
	int index;
	string word;
	text.open("cleanedText.txt");
	while(text >> word)
	{
		// Checks if word is in the array
		bool isUnique = true;
		for(int i = 0; i < N; i++)
		{
			if(word == UniqueWordArr[i].word)
			{
				isUnique = false;// Sets the flag to false
				index = i;        // Sets the index for the array location
				continue;		  // Skips the rest of the pairs
			}
		}
		if(isUnique == true)
		{
			UniqueWordArr[count].word = word; // Creates new variable in the struct
			UniqueWordArr[count].noOccurances = 1;
			count++;
		}
		else
			UniqueWordArr[index].noOccurances++;// Counts repetitions
	}
	
	sortArray(UniqueWordArr,count);
	
	cout << "The number of unique words is " << count << endl;
	cout << "\nThe 10 most common words are:" << endl;
	
	// Prints out 10 most common and 10 least common combinations
	for(int i = count-1; i > 0; i--)
	{
		if(i >= count - 10)
			cout << UniqueWordArr[i].word << " " << UniqueWordArr[i].noOccurances << endl;
		if(i == 9)
			cout << "\nThe 10 least common words are:" << endl;
		if(i < 10)
			cout << UniqueWordArr[i].word << " " << UniqueWordArr[i].noOccurances << endl;
	}
	text.close();
	return 0;
}

// Modified sort array function
void sortArray(struct UniqueWords arr[], int N)
{
	UniqueWords temp;
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