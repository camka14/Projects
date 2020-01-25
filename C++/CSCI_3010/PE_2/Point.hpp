#ifndef _POINT_HPP_ 
#define _POINT_HPP_
#include <vector>

class Point {
    public:
        Point(int n); // Constructor, size
        Point(std::vector<int> points); // Constructor, two args

        float Distance(Point *p2); // Distance calculator
        void Translate(int move); // Translates the point
        int get(int loc) { return points_[loc]; };  // Returns inputed index
        int get_size(){ return size_;}
        void set(int loc, int val);

    private:
    	std::vector<int> points_;
        int size_;
};

#endif