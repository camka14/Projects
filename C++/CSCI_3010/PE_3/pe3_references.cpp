#include <iostream>

// Name: Samuel Razumovskiy
//

// Write any functions you need here!
int* temp(int const & n){
    int n1 = 2*n;
    int * out = &n1;
    return out;
};

class Values{
public:
    Values(){num_ = 0;};
    Values(int num){num_ = num;};
    int get(){return num_;};
    bool operator== (const Values &obj){
        return num_ == obj.num_;
    };
    Values operator+ (const Values &obj){
        Values out;
        out = num_ + obj.num_;
        return out;
    };
private:
    int num_;
};



int main() {
    // Add as many prints to cout as you need to answer the questions.
    // Leave them in your code when you turn it in.
    // If you have lines of code that cause errors that test the questions,
    // leave this code in your file but comment it out.
    
    // 1) Declare an int
    int a = 0;

    // 2) Declare a pointer to that int
    int * pa = &a;

    // 3) Increment the int via the pointer
    (*pa)++;

    // 4) Declare a reference to your int
    int & ra = a;

    // 5) Increment the int via the reference
    ra++;

    // 6) When you increment the int via the variable declared in #1, which
    // variables will be modified to see the changes? (the pointer , reference or both?)
    // Answer: Both will be incremented

    // 7) When you increment the int via the pointer declared in #2, which
    // variables will be modified to see the changes?
    // Answer: Both

    // 8) When you increment the int via the reference declared in #4, which
    // variables will be modified to see the changes?
    // Answer: Both

    // 9) Write a function that takes an int * parameter. How would you pass the 
    // variable from #1 into this function? (write the function header and function call below)
    // void temp(int * n);
    // temp(&a);

    // 10) Can you pass your reference from #4 to the function from #9 without accessing its address?
    // Answer: No

    // 11) Write a function that takes an int & parameter. How would you pass the 
    // variable from #1 into this function? (write the function header and call below)
    // void temp(int & n);
    // temp(a)

    // 12) Can you pass your pointer from #2 to the function from #11 without dereferencing it?
    // Answer: No

    // 13) Can you pass your reference from #4 to the function from #11?
    // Answer: Yes

    // 14) Write a function that takes one const reference input parameter and one pointer
    // output parameter. The function should fill in the value of the output parameter based
    // on the value of the input parameter. (what it does exactly is up to you).
    // Call your function 3 times below. Be sure to include output as necessary to be sure
    // your function works as described.
    int * pn;
    pn = temp(1);
    std::cout << *pn << std::endl;
    pn = temp(3);
    std::cout << *pn << std::endl;
    pn = temp(-2);
    std::cout << *pn << std::endl;

    // 15) What is/are the difference(s) between output parameters and return values?
    // Answer: Output parameters are generally passed by reference and can be manipulated without being returned.
    // Return values are passed to he return command.

    // 16) Create a custom class with at least one private field/class attribute. Overload the == and + operator for this class
    // such that == can be used to compare the objects of the class and + can be used to add
    // 2 objects of the class together. Implement an appropriate constructor for your class.
    // When you overload these operators, the resulting return value should make sense.
    // Instantiate at least 2 objects of this class and perform the == and + operations on them.
    // hint: for operator+, the function signature when implemented as a member function of the Object class is:
    // Object operator+(const Object &other)
    // Answer:
    Values V1;
    Values V2(3);
    bool tr = V1 == V2;

    Values V3(V1+V2);
    std::cout << "V1 == V2 = " << tr << std::endl;
    std::cout << "V1 + V2 = " << V3.get() << std::endl;
}
