#include <iostream>

void products(int arr[], int len){
    int product = 1;
    for(int i=0; i<len; i++){
        for(int j=i; j<len; j++){
            product = product*arr[j];
            std::cout << product << std::endl;
        }
        product = 1;
    }
}

int main(){
    int arr[5] = {1, 2, 3, 4, 5};
    products(arr,5);
}