#include <iostream>
#include <string>
#include <vector>

// Names: Samuel Razumovskiy, Nathan Jager
//
//


// 1) implement two functions, AddToValues(std::vector<int> v1, int v2)
// and AddToValues(std::vector<double> v1, double v2)

// 2) Do your AddToValues functions have return values? why/ why not?
// Answer: Yes because vectors are passed by value

std::vector<int> AddToValues(std::vector<int> v1, int v2)
{
    for(int i=0; i<v1.size(); i++)
    {
        v1[i] += v2;
    }
    return v1;
}

std::vector<double> AddToValues(std::vector<double> v1, double v2)
{
    for(int i=0; i<v1.size(); i++)
    {
        v1[i] += v2;
    }
    return v1;
}

int main() {
    // 3) Instantiate an int vector
    std::vector<int> v1 = {1,1,1,1,1};

    // 4) call AddToValues, passing in your int vector and another int.
    AddToValues(v1,3);

    // 5) compile this file to object code
    // g++ -std=c++17 -Wall exercises.cpp -c

    // then run the command: nm -C exercises.o | grep "AddToValues"
    // How many versions of the AddToValues function are in the
    // compiled object code? Copy + paste the relevant lines here:
    // 0000000000000079 T AddToValues(std::vector<double, std::allocator<double> >, double)
    // 0000000000000000 T AddToValues(std::vector<int, std::allocator<int> >, int)
    //
    // If the -C flag isn't working, you can omit it and still complete the exercise--this flag
    // makes the output easier to read but isn't strictly necessary
}
