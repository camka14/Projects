#include <iostream>
#include <string>
#include <vector>

// Names:Samuel Razumovskiy, Nathan Jager
//
//


// we'd like to write a function that is applicable to many types but
// we don't want to copy paste everything

// For example, here is a templated Add function
template <typename T>
T Add(T v1, T v2) {
    return v1 + v2;
}

// 6) implement a templated version of AddToValues, "AddToValues2".
template <typename T>
std::vector<T> AddToValues2(std::vector<T> v1, T v2)
{
    for(int i=0; i<v1.size(); i++)
    {
        v1[i] += v2;
    }
    return v1;
}

int main() {
    // 7) call AddToValues2, passing in an int vector and another int.
    std::vector<int> v = {1,1,1,1,1};
    AddToValues2<int>(v,3);

    // 8) compile this file to object code
    // g++ -Wall -std=c++17 exercises2.cpp -c
    // then run: nm -C exercises2.o | grep "AddToValues2"
    // How many versions of the AddToValues2 function are in the
    // compiled object code? Copy + paste the relevant lines here:
    // 0000000000000000 W std::vector<double, std::allocator<double> > AddToValues2<double>(std::vector<double, std::allocator<double> >, double)

    // 9) call AddToValues2, passing in a vector of a non-int type and a value that you can add
    // successfully to the elements
    std::vector<double> v2 = {1,1,1,1,1};
    AddToValues2<double>(v2,3);

    // 10) compile this file to object code
    // g++ -Wall -std=c++17 exercises2.cpp -c
    // then run: nm -C exercises2.o | grep "AddToValues2"
    // How many versions of the AddToValues2 function are in the
    // compiled object code? Copy + paste the relevant lines here:
    // 0000000000000000 W std::vector<double, std::allocator<double> > AddToValues2<double>(std::vector<double, std::allocator<double> >, double)
    // 0000000000000000 W std::vector<int, std::allocator<int> > AddToValues2<int>(std::vector<int, std::allocator<int> >, int)

    // 11) Experiment to find calls to this function that you would like to work but that do
    // not yet work. for each function call that doesn't work, comment about what type of 
    // error is produced.

    // The error produced: no matching function for call to ‘AddToValues2<std::__cxx11::string>(std::__cxx11::string&, const char [2])’
    // std::string st = "hello";
    // AddToValues2<std::string>(st,"j");

    // no matching function for call to ‘AddToValues2<int>(int [4], int)’
    // int ar[4] = {3,2,4,1};
    // AddToValues2<int>(ar,4);

    // 12) Create a struct that has an int field. Instantiate a vector of these structs.
    // Instantiate another instance of this struct.
    
    // 13) Call AddToValues2 w/ the vector of structs and single struct from #12
    // Is there an error? If yes, what is it?
    //
    // Answer:

    // 14) If there was an error, attempt to fix it.
}
