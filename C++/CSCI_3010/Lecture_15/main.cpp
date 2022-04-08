#include <iostream>
#include <vector>

#include "Disease.h"
#include "Creature.h"

// Names: Samuel Razumovskiy
//
//


int main() {
    // Part 1 (factory) 
    // ---------------
    // 4) get pointers to one of each type of your Disease objects via your DiseaseFactory. Then,
    // call the Disease's get_count method to see how many Disease objects have been instantiated.
    Disease* cancer = DiseaseFactory::GetCancer();
    Disease* cold = DiseaseFactory::GetCold();
    Disease* flu = DiseaseFactory::GetFlu();

    std::cout << cold->get_count() << std::endl;

    // 5) are your DiseaseFactory's Get____() methods static or non-static? Do you think that they should
    // be one or the other? Justify your answer. If your methods are static, what would change if they were
    // non-static? If they are non-static, what would change if they were static?
    
    // They are static, which is good since you then wouldn't need a instance of DiseaseFactory. Otherwise you would need
    // an instance of DiseaseFactory

    // 6) Feel free to create more creatures here
    Creature original_creature(14);
    Creature Sam(22);
    Creature Nathan(20);
    Creature Andrew(23);

    // 7) Infect your creatures with your diseases. Test out the Creature Spread method.
    // Warning: Spread is an _UNTESTED_ method. 
    original_creature.Infect(flu);
    original_creature.Spread(&Sam);
    Nathan.Infect(cancer);
    Andrew.Infect(cold);
    Nathan.Spread(&Sam);


    for (Disease * d : original_creature.get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }
    for (Disease * d : Sam.get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }
    for (Disease * d : Nathan.get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }
    for (Disease * d : Andrew.get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }

    // STOP! Turn in Disease.h, Disease.cpp, and main.cpp on canvas

 
    // Part 2 (prototype) 
    // ---------------
    // 3) Create some new Creature * objects by using the Creature's Clone() method. Does this method use dynamic dispatch?
    // Answer:
    // How did you test this?


    Creature *c1 = Nathan.Clone();
    for (Disease * d : c1->get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }

    Person Camka(20);
    Camka.Infect(flu);
    Person* CamkaClone = Camka.Clone();
    for (Disease * d : Camka.get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }

    for (Disease * d : CamkaClone->get_diseases() ) {
        std::cout << *(d) << std::endl;     
    }


    // If you finish:
    // -------------
    // 4) Write a new function in this file void ScienceLab(Creature * original) (not associated with any classes)
    // that takes an original creature and conducts experiments by cloning it and measuring the spread of disease.
    // You have complete creative freedom here. Feel free to add methods to the Disease/Creature classes.
    // (The only requirements are the function definition and that you must call Clone() within that function).
    //
    // Call your ScienceLab function as many times as is necessary for your experiments.
}

