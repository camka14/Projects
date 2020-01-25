#ifndef _POINT_HPP_ 
#define _POINT_HPP_

class Point {
    public:
        Point(); // Constructor, no args
        Point(int x, int y); // Constructor, two args

        float distance(Point *p2); // Distance calculator
        void translate(int x_move, int y_move); // Translates the point
        int get_x() { return x_; }; // Returns x
        int get_y() { return y_; }; // Returns y

    private:
    	int x_;
    	int y_;
};

#endif