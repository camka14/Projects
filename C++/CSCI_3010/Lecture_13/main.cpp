#include <iostream>
#include "Earth.h"

// Names: Samuel Razumovskiy, Nathan Jager
//

int main(int argc, char **argv){
    // 0) Implement your Earth's constructor in Earth.cpp

    // 1) Get an instance of your earth object
    Earth &e = Earth::GetInstance();
    // 2) Get another instance of your earth object
    Earth &e2 = Earth::GetInstance();
    // 3) Test to see if the two Earth instances from #1 and #2 are stored at the same
    // location in memory.
    if(&e == &e2){
        std::cout << "Same" << std::endl;
    }else{
        std::cout << "Different" << std::endl;
    }
    // 3) Call IncreasePopulation from one of your Earth instances. Can you see this change
    // from your other Earth instance?
    std::cout << e.get_population() << std::endl;
    std::cout << e2.get_population() << std::endl;
    e.IncreasePopulation();
    std::cout << e.get_population() << std::endl;
    std::cout << e2.get_population() << std::endl;
    // 4) Create a public field in your Earth object. Do you need an instance of an Earth object
    // to access this field?

	return 0;
}
