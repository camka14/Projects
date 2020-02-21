#include <iostream>

#include "Animal.h"

// Name(s): Samuel Razumovskiy

int main() {

  Reptile ralph("alligator");
  std::cout << ralph.MakeSound() << std::endl;

  // 1) Instantiate another animal 
  Animal cow("moo");
  // 2) Call the Fight method of animal
  cow.Fight(ralph);
  // 3) Go to the Animal.h file and define some new subclasses of animal
  // Define one class that inherits from Animal and
  // one class that inherits from a child class of Animal

  // 4) Instantiate at least one object of each class you defined for #3
  Mammal dog("Bark");
  Rabbit carrot;
  // 5) Have a tournament between the animals that you have instantiated 
  dog.Fight(cow);
  carrot.Fight(ralph);
  dog.Fight(ralph);
  // 6) turn in Animal.h and main.cpp on canvas
    
	return 0;
}
