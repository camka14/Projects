#include <iostream>
#include <string>

using namespace std;

/*
Name: Samuel Razumovskiy
ID: 109343605
Course: 1320
Lab: 11
Recitation: 108
*/


class AnimalPatient
{
	private:

	string name;
	string species;
	int age;
	int weight;

	public:
	
	// 4 input constructor
	AnimalPatient(string name, string species, int age, int weight)
	{
		name = name;
		species = species;
		age = age;
		weight = weight;
	}
	// No input constructor
	AnimalPatient()
	{
		name = "liger";
		species = "liger";
		age = -1;
		weight = -1;
	}
	
	void setName(string name)
	{
		name = name;
	}
	
	void setSpecies(string species)
	{
		species = species;
	}
	
	void setAge(int age)
	{
		if(age >= 0)
			age = age;
	}
	
	void setWeight(int weight)
	{
		if(weight >= 0)
			weight = weight;
	}
	
	void convertWeight()
	{
		weight = weight * 0.453592;
	}
};

int main()
{
	AnimalPatient animals[3];
	string name;
	string species;
	int age;
	int weight;
	
	for(int i = 0; i < 3; i++){
		cout << "Input animal No." << i+1 << "'s name: ";
		cin >> name;
		animals[i].setName(name);
		cout << "Input animal No." << i+1 << "'s species: ";
		cin >> species;
		animals[i].setSpecies(species);
		cout << "Input animal No." << i+1 << "'s age: ";
		cin >> age;
		animals[i].setAge(age);
		cout << "Input animal No." << i+1 << "'s weight: ";
		cin >> weight;
		animals[i].setWeight(weight);
	}
	
	return 0;
}