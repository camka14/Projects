#ifndef CREATURE_H
#define CREATURE_H


class Creature {
public:
    Creature(int age): age_(age)
    {
        std::vector<Disease *> tmp;
        this->diseases_ = tmp;
    }

    int get_age() const { return age_; };
    
    void age(int years) { age_ += years; };

    std::vector<Disease *> get_diseases() const {return diseases_; }; 

    void Spread(Creature * c2);
    void Infect(Disease * d) { diseases_.push_back(d); };

    // 1) Create a virtual Creature * Clone() method.
    // When a creature is cloned, the clone starts at age 0
    // Diseases that are hereditary should be inherited.
    virtual Creature* Clone();

private:
    int age_;
    std::vector<Disease *> diseases_;
};


// 2) Create 1 subclass of Creature. For this subclass,
// make its cloning behavior slightly different.
// For instance, some Cloned creatures might also inherit non-hereditary diseases.
// It's up to you!
class Person : public Creature{
public:
    Person(int age):Creature(age){};

    Person* Clone();
};

// 3) In your main.cpp, instantiate your subclass. (the rest of the work for this
// part of the exercise will happen in main.)

#endif // CREATURE_H
