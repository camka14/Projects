#include<iostream>
#include<fstream>
#include<string>

using namespace std;

int main()
{
	// Variable Initialization
	ifstream text;
	ifstream ignore;
	ofstream test;
	int count = 0;
	string word;
	string ignword;
	string ignWordArr[50];
	text.open("HungerGames.txt");
	ignore.open("ignoreWords.txt");
	test.open("cleanedText.txt");
	
	// Makes list of ignored words
	while(ignore >> ignword)
	{
		ignWordArr[count] = ignword;
		count++;
	}
	
	while(text >> word)
	{
		bool ignoreWord = false;
		for(int i = 0; i < 50; i++)
		{
			if(word == ignWordArr[i]) // Checks if word is to be ignored
				ignoreWord = true;
		}
		if(ignoreWord == false)
		{
			test << word << " "; // Adds word to file if not ignored
		}
	}
	text.close();
	ignore.close();
	test.close();
	return 0;
}