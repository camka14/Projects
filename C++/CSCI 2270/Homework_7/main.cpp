#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>
#include "HashTable.hpp"

using namespace std;

int main(int argc, char *argv[])
{
	int toPrint = stoi(argv[1]);
	HashTable words {stoi(argv[4])};
	HashTable ignoreWords {STOPWORD_TABLE_SIZE};
	char *filename = argv[3];
	string word;
	ifstream text;

	getStopWords(filename,ignoreWords);

	text.open(argv[2]);

	while (text >> word)
	{
		if(words.isInTable(word)){
		    words.incrementCount(word);
		}

		else if(!isStopWord(word,ignoreWords)){
			words.addWord(word);
		}
	}
	words.printTopN(toPrint);
	cout << "#" << endl;
	cout << "Number of collisions: "  << words.getNumCollisions() << endl;
	cout << "#" << endl;
	cout << "Unique non-stop words: " << words.getNumItems() << endl;
	cout << "#" << endl;
	cout << "Total non-stop words: " << words.getTotalNumWords() << endl;
	text.close();
}