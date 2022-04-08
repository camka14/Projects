#ifndef Counter_HPP
#define Counter_HPP
#include <vector>
#include <string>
#include <iostream>
#include <map>
#include <set>
#include <climits>
#include <exception>


template <class T>
class Counter {
    public:
        Counter(){total_ = 0;}; // initialize an empty Counter<T>

        Counter(std::vector<T> vals); // initialize a Counter<T> appropriately from a vector or array that contains type T

        int Count(); // access the total of all counts so far
        int Count(T key); // access the count associated with any object T, even for values of T that have not been counted
        int Count(T min, T max); // access the total of all counts for objects T given a certain range (an inclusive minimum T and an exclusive maximum T element)

        void Remove(T key); //remove all counts of an object T from the Counter

        void Increment(T key); // increment the count of an object T by one 
        void Increment(T key, int n); // increment the count of an object T by n

        void Decrement(T key); // decrement the count of an object T by one
        void Decrement(T key, int n); // decrement the count of an object T by n

        T MostCommon(); // get the most commonly occurring object of type T(the object with the highest count)If the Counter is empty, this method should throw a domain error
        std::vector<T> MostCommon(int n); // get the n most commonly occurring objects of type T

        T LeastCommon(); // get the least commonly occurring object of type T(the object with the highest count)If the Counter is empty, this method should throw adomain error
        std::vector<T> LeastCommon(int n); // get the n least commonly occurring objects of type T

        std::map<T, double> Normalized(); // access normalized weights for all objects of type T seen so far normalized weights

        std::set<T> Keys(); // access the set of all keys in the Counter
        std::vector<int> Values(); // access the collection of all values in the Counter

        template <typename U>
        friend std::ostream& operator<<(std::ostream& os, const Counter<U> &b); // overload the << operator for Counter<T>

    private:
        std::map<T, int> cmap_;
        int total_;
};

template <typename T>
Counter<T>::Counter(std::vector<T> vals){
    total_ = 0;
    std::pair<typename std::map<T,int>::iterator,bool> ret;
    for(int i=0; i<vals.size(); i++){
        ret = cmap_.insert ( std::pair<T,int>(vals[i],1) );
        if(ret.second == false){
            ret.first->second++;
        }
        total_++;
    }
}

template <typename T>
int Counter<T>::Count(){
    return total_;
}

template <typename T>
int Counter<T>::Count(T key){
    return cmap_[key];
}

template <typename T>
int Counter<T>::Count(T min, T max){
    int count = 0;
    for( auto const& [key, val] : cmap_ ){
        if(key >= min && key < max)
            count += val;
    }
    return count;
}

template <typename T>
void Counter<T>::Remove(T key){
    cmap_.erase(key);
}

template <typename T>
void Counter<T>::Increment(T key){
    cmap_[key]++;
    total_++;
}

template <typename T>
void Counter<T>::Increment(T key, int n){
    cmap_[key] += n;
    total_ += n ;
}

template <typename T>
void Counter<T>::Decrement(T key){
    if(cmap_.count(key)<0){
        return;
    }else if(cmap_[key] > 0){
        cmap_[key]--;
        total_--;
    }
}

template <typename T>
void Counter<T>::Decrement(T key, int n){
    if(cmap_.count(key)<0){
        return;
    }else if(cmap_[key] - n < 0){
        total_ -= cmap_[key];
        cmap_[key] = 0;
    }else{
        cmap_[key] -= n;
        total_ -= n;
    }
}

template <typename T>
T Counter<T>::MostCommon(){
    if(cmap_.empty()){
        throw std::domain_error("The Counter is empty" );
    }
    int maxVal = 0;
    T maxKey;
    for( auto const& [key, val] : cmap_ ){
        if(val > maxVal){
            maxVal = val;
            maxKey = key;
        }
    }

    return maxKey;
}

template <typename T>
std::vector<T> Counter<T>::MostCommon(int n){
    if(cmap_.empty()){
        return std::vector<T>();
    }
    std::vector<int> maxVals(n, 0);
    std::vector<T> maxKeys;
    maxKeys.resize(n);
    int dif;
    int swap;
    bool found;
    for(auto const& [key, val] : cmap_){
        found = false;
        int maxDif = 0;
        for(int i=0; i<n; i++){
            dif = val - maxVals[i];
            if(dif > maxDif && dif > 0){
                maxDif = dif;
                swap = i;
                found = true;
            }
        }
        if(found){
            maxVals[swap] = val;
            maxKeys[swap] = key;
        }
    }
    return maxKeys;
}

template <typename T>
T Counter<T>::LeastCommon(){
    if(cmap_.empty()){
        throw std::domain_error("The Counter is empty" );
    }
    int minVal = INT_MAX;
    T minKey;
    for( auto const& [key, val] : cmap_ ){
        if(val < minVal){
            minVal = val;
            minKey = key;
        }
    }
    return minKey;
}

template <typename T>
std::vector<T> Counter<T>::LeastCommon(int n){
    if(cmap_.empty()){
        return std::vector<T>();
    }
    std::vector<int> minVals(n, INT_MAX);
    std::vector<T> minKeys;
    minKeys.resize(n);
    int dif;
    int swap;
    bool found;
    for(auto const& [key, val] : cmap_){
        found = false;
        int minDif = INT_MIN;
        for(int i=0; i<n; i++){
            dif = minVals[i] - val;
            if(dif > minDif && dif > 0){
                minDif = dif;
                swap = i;
                found = true;
            }
        }
        if(found){
            minVals[swap] = val;
            minKeys[swap] = key;
        }
    }
    return minKeys;
}

template <typename T>
std::map<T, double> Counter<T>::Normalized(){
    std::map<T, double> norm;
    for(auto const& [key, val] : cmap_){
        norm.insert(std::pair<T,double>(key,(double)val/total_));
    }
    return norm;
}

template <typename T>
std::set<T> Counter<T>::Keys(){
    std::set<T> out;
    for(auto const& [key, val] : cmap_){
        out.insert(key);
    }
    return out;
}

template <typename T>
std::vector<int> Counter<T>::Values(){
    std::vector<int> out;
    for(auto const& [key, val] : cmap_){
        out.push_back(val);
    }
    return out;
}

template <typename U>
std::ostream& operator<<(std::ostream& os, const Counter<U> &b){
    typename std::map<U,int>::const_iterator it = b.cmap_.begin();
    os << "{";
    for (typename std::pair<U, int> el : b.cmap_){
        os << el.first << ":" << el.second << ",";
    }
    os << "}" << std::endl;
    return os;
}
#endif