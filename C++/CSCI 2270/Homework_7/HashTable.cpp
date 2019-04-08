#include "HashTable.hpp"
#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;

HashTable::HashTable(int hashTableSize)
{
	hashTable = new wordItem*[hashTableSize];
	this->hashTableSize = hashTableSize;
	numItems = 0;
	numCollisions = 0;
    for(int i=0;i<hashTableSize;i++)
    	hashTable[i] = nullptr;
}

HashTable::~HashTable()
{
	delete[] hashTable;
}

wordItem* createWordItem(string word, wordItem* next)
{
    wordItem* nw = new wordItem;
    nw->word = word;
    nw->count = 1;
    nw->next = next;
    return nw;
}

void HashTable::addWord(string word)
{
	if(!isInTable(word))
    {
    	numItems++;
        int index = getHash(word);
        if(!hashTable[index])
            hashTable[index] = createWordItem(word,nullptr);
        else{
        	numCollisions++;
            wordItem *temp = hashTable[index];
            while(temp->next)
                temp = temp->next;
            temp->next = createWordItem(word,nullptr);
        }
     }
    else{
    	incrementCount(word);
    }
}

bool HashTable::isInTable(string word)
{
	wordItem *temp;
	temp = searchTable(word);
	if(temp)
		return true;
	else
		return false;
}

void HashTable::incrementCount(string word)
{
	wordItem *temp = searchTable(word);
	temp->count++;
}

void HashTable::printTopN(int n)
{
	int size = getNumItems();
	int index = 0;
	wordItem *arr[size] = {nullptr};
	wordItem *temp;
    float finalCount = getTotalNumWords();
	for(int i=0;i<hashTableSize;i++)
	{
		temp = hashTable[i];
		while(temp)
		{
			arr[index] = temp;
			temp = temp->next;
			index++;
		}
	}
	for(int i = size-1; i>0; i--){
		for(int j = 0; j < i; j++){
			if(arr[j]->count<arr[j+1]->count){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	//cout << fixed << setprecision(4);
	for(int i=0;i<n;i++)
	{
		cout << float(arr[i]->count)/finalCount << " - " << arr[i]->word << endl;
	}
}

int HashTable::getNumCollisions()
{
	return numCollisions;
}

int HashTable::getNumItems()
{
	return numItems;
}

int HashTable::getTotalNumWords()
{
	wordItem *temp;
	int total = 0;
	for(int i=0;i<hashTableSize;i++)
	{
		temp = hashTable[i];
		while(temp)
		{
			total += temp->count;
			temp = temp->next;
		}
	}
	return total;
}

unsigned int HashTable::getHash(string word)
{
	unsigned int hashValue = 5381;
	int length = word.length();
	for (int i=0;i<length;i++)
	{
		hashValue=((hashValue<<5)+hashValue) + word[i];
	}
	cout<<"ran";
	exit(0);
	hashValue %= hashTableSize;
	cout<<"ran";
	exit(0);
	return hashValue;
}

wordItem* HashTable::searchTable(string word)
{
	int index = getHash(word);
    wordItem *temp = hashTable[index];
    while(temp)
    {
        if(temp->word == word)
            return temp;
		temp = temp->next;
    }
    return nullptr;
}

void getStopWords(char *ignoreWordFileName, HashTable &stopWordsTable)
{
	string word;
	ifstream textStop;
	textStop.open(ignoreWordFileName);
	while (textStop >> word)
	{
		stopWordsTable.addWord(word);
	}
	textStop.close();
}

bool isStopWord(string word, HashTable &stopWordsTable)
{
	return stopWordsTable.isInTable(word);
}