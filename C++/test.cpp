#include <iostream>
#include <cmath>
#include <bitset>

using namespace std;

int func(short x, short y, short a, int b[]){
    for(;x<a;x++){
        if(y == b[x]){
            return x;
        }
    }
    return -1;
}

int main(int argc, char ** argv)
{
	int b[] = {0,1,2,3};
	std::cout << func(1,3,4,b) << std::endl;
}