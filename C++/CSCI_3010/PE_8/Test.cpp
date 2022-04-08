#include <string>

template <typename T>
void Swap(T & a, T & b);

int main(){
    int a = 1;
    int b = 2;
    double c = 2.0;
    double d = 3.0;
    std::string e = "hey";
    std::string f = "hi";
    Swap(a,b); // works
    Swap(e,f); // works
    // Swap(a,c); // doesn’t work
    Swap(e,f); // doesn’t work

    
}

template <typename T>
void Swap(T & a, T & b){
T temp = a;
a = b;
b = temp;
}
