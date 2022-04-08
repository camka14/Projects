#include <iostream>
#include <string>
#include "Counter.hpp"

int main(){
    std::cout << "here";

    Counter<std::string> c1(std::vector<std::string> {"cat", "dog", "hamster","eagle"});
    c1.Increment("cat", 7);
    c1.Increment("dog", 3);
    c1.Increment("hamster", 1);
    c1.Increment("eagle", 5);
    std::map<std::string,double> m;
    std::cout << "here";
    m = c1.Normalized();

    std::cout << c1 << std::endl;
}