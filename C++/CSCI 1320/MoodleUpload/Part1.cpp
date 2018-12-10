#include<iostream>
#include<fstream>
#include<string>

using namespace std;

int main()
{
	ifstream text;
	ofstream test;
	int count = 0;
	string word;
	text.open("HungerGames.txt");
	test.open("testText.txt");
	while(text >> word)
	{
		count++;
		if(count <= 100)
			test << word+" "; // Writes to file if the count is less than or equal to 100
	}
	cout << count << endl;
	text.close();
	test.close();
	return 0;
}