#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>

using namespace std;

struct wordItem {
	string word;
	int count = 0;
};

void doubleArray(wordItem *&p1, int &N);

void getStopWords(const char *ignoreWordFileName, string ignoreWords[]);

bool isStopWord(string word, string ignoreWords[]);

int getTotalNumberNonStopWords(wordItem uniqueWords[], int length);

void arraySort(wordItem uniqueWords[], int length);

void printTopN(wordItem uniqueWords[], int topN, int totalNumWords);

int main(int argc, char const *argv[])
{
	int N = 100;
	int uniqueCount = 0;
	int doubled = 0;
	int toPrint = stoi(argv[1]);
	wordItem *p1 = new wordItem[N];
	string words;
	string word;
	string ignoreWords[50];
	ifstream text;

	getStopWords(argv[3],ignoreWords);

	text.open(argv[2]);

	while (text >> word)
	{
		bool flag = false;

		if (uniqueCount == N){
			doubleArray(p1,N);
			doubled++;
		}

		for (int i=0; i<50; i++){
			if (isStopWord(word,ignoreWords))
				flag = true;
		}

		for (int i=0; i<N; i++){
			if (word == p1[i].word){
				flag = true;
				p1[i].count++;
			}
		}

		if (flag == false){
			p1[uniqueCount].word = word;
			// cout << p1[uniqueCount].word << endl;
			p1[uniqueCount].count = 1;
			uniqueCount++;
		}
	}
	text.close();
	int totalWords = getTotalNumberNonStopWords(p1,N);
	arraySort(p1,N);
	cout << "Array doubled: " << doubled << endl;
	cout << "#" << endl;
	cout << "Unique non-common words: " << uniqueCount << endl;
	cout << "#" << endl;
	cout << "Total non-common words: " << totalWords << endl;
	cout << "#" << endl;
	cout << "Probabilities of top " << toPrint << " most frequent words" << endl;
	cout << "---------------------------------------" << endl;
	printTopN(p1, toPrint, totalWords);
}

/////////////////////////////////////////////////////////

void doubleArray(wordItem *&p1, int &N)
{

	wordItem *p2 = new wordItem[2*N];
	for(int i=0; i<N; i++){
		p2[i] = *(p1+i);
	}

	N = 2*N;
	
	delete[] p1;
	p1 = p2;
}

void getStopWords(const char *ignoreWordFileName, string ignoreWords[])
{
	int j = 0;
	string word;
	ifstream ignore;
	ignore.open(ignoreWordFileName);
	while (getline(ignore, word))
	{
		ignoreWords[j] = word;
		j++;
	}
	ignore.close();
}

bool isStopWord(string word, string ignoreWords[])
{
	for(int i=0 ; i<50 ; i++){
		if(word == ignoreWords[i])
			return true;
	}
	return false;
}

int getTotalNumberNonStopWords(wordItem uniqueWords[], int length)
{
	int total = 0;
	for (int i=0; i<length; i++){
		total += uniqueWords[i].count;
	}
	return total;
}

void arraySort(wordItem uniqueWords[], int length)
{
	wordItem temp;
	for(int i = length-1; i>0; i--)
	{
		for(int j = 0; j < i; j++){
			if(uniqueWords[j].count<uniqueWords[j+1].count){
				temp = uniqueWords[j];
				uniqueWords[j] = uniqueWords[j+1];
				uniqueWords[j+1] = temp;
			}
		}
	}
}

void printTopN(wordItem uniqueWords[], int topN, int totalNumWords)
{
	for(int i=0; i<topN; i++){
		cout << fixed << setprecision(4) << double(uniqueWords[i].count)/double(totalNumWords) << " - " << uniqueWords[i].word << endl;
	}
}