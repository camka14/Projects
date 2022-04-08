#include <iostream>

#include "Tree.h"

// Names: Samuel Razumovskiy, Nathan Jager
//


int main() {
    Tree oak;
    std::cout << "Number of trees: " << oak.get_number_seeds() << std::endl;

    // 0) Attempt to directly access the number_seeds_ static field here. Can you do so? why/why not?
    // std::cout << oak.number_seeds_ << std::endl; Does not work since it is a private variable
    // 1) Instantiate another Tree object here
    Tree pine;

    // 2) Call get_number_seeds() from your tree object instantiated at #1
    std::cout << pine.get_number_seeds() << std::endl;

    // 3) Test to see whether pointers to your two Tree objects are equal.
    Tree *p1 = &oak;
    Tree *p2 = &pine;

    if(p1->get_number_seeds() == p2->get_number_seeds()){
        std::cout << "Equal" << std::endl;
    }else{
        std::cout << "Not Equal" << std::endl;
    }

    // 4) Call Seed() from the Tree object oak and Seed() from the Tree object instantiated at #1
    // Does changing the value of number_seeds_ from one tree object affect what you see from the
    // other Tree object by calling get_number_seeds()?
    oak.Seed();
    std::cout << pine.get_number_seeds() << std::endl;
    std::cout << oak.get_number_seeds() << std::endl;
    pine.Seed();
    std::cout << oak.get_number_seeds() << std::endl;
    std::cout << pine.get_number_seeds() << std::endl;
    // Yes the values are effecting one another

    // 5) Add a subclass of the Tree object. Your subclass should overwrite the Seed() method so that
    // when your subclass uses Seed(), the number_seeds_ should increase by two. Write adequate code
    // to experiment how the static field changes when calling Seed() with your regular Trees versus with the
    // derived class that you implemented. Don't forget the keyword virtual and remember that you shouldn't
    // add a new field to your Tree subclass to accomplish this!
    Pine evergreen;
    evergreen.Seed();
    std::cout << "Should be 4 :" << evergreen.get_number_seeds() << std::endl;

    // 6) Add a public static variable to your Tree class that counts how many Trees (and Tree subclasses)
    // have been instantiated. Can you access this via a Tree instance? Can you access it without an instance of Tree?
    // e.g.
    //std::cout << Tree::variable_name << std::endl;
    //std::cout << instance.variable_name << std::endl;


}
