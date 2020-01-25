#include <iostream>
#include <vector>
#include "Library.h"

// Name(s): Samuel Razumovskiy, Nathan Jager
//
// Complete numbered coding tasks.
// Answer the questions with "Answer: " in the comments by writing your answer in the comments.
// some experiments might result in non-running/non-compiling code. Leave these experiments in, but
// comment them out.
// Turn in run_library.cpp, Library.h, and Library.cpp on Canvas before the end of class.
// make sure to leave a comment here and on canvas with your name and the name(s) of your partners.

int main() {
    // 1) Instantiate a couple Books. Set their fields equal to some values.
    // Print out the values of the books' fields.
    Book B1,B2,B3;
    B1.title = "B1";
    B2.title = "B2";
    B3.title = "B3";
    B1.author = "A1";
    B2.author = "A2";
    B3.author = "A3";
    std::cout << B1.title << std::endl;
    std::cout << B1.author << std::endl;

    std::cout << B2.title << std::endl;
    std::cout << B2.author << std::endl;

    std::cout << B3.title << std::endl;
    std::cout << B3.author << std::endl;


    // 2) Instantiate a Library.

    Library lib;
   
    // 3) Add a void Donate(Book b) method to your Library class.
    // Your Library should store the new book at the end of its shelf.

    // 4) Donate one of the Books that you instantiated to your Library.
   lib.Donate(B1);

    // 5) Print out the books in the Library (use the given PrintBooks method)
    
    lib.PrintBooks();

    // 6) Change the title and/or author of the book that you donated to
    // something different.
    // Print out the new book information, then print out the books in your
    // Library. Did changing the Book information change it in your Library?
    //
    // Answer (and your hypothesis for why/why not): It did not change, since the object was passed by value.

    B1.title = "title";
    B1.author = "author";
    std::cout << "new title: title" << std::endl;
    std::cout << "new author: author" << std::endl;
    lib.PrintBooks();
    
    // 7) Create two Books that are separate structs (not pointers or references)
    // but that have the same information.
    // use the == operator to test if they are equal. What happens?
    // if it succeeds, are these equal?
    //
    // Answer: Does not compile
    Book B4;
    B4.title = "B2";
    B4.author = "A2";
    if (B1 == B2){
        std::cout << "value comparison: equal" << std::endl;
    }else{
        std::cout << "value comparison: unequal" << std::endl;
    }

    // 8) Create two Book references to your Books from # 7.
    // use the == operator to test if they are equal. What happens?
    // if it succeeds, are these equal?
    //
    // Answer: Does not compile
    Book &RefB1 = B2, &RefB2 = B4;

    if (RefB1 == RefB2){
        std::cout << "value comparison: equal" << std::endl;
    }else{
        std::cout << "value comparison: unequal" << std::endl;
    }

    // 9) Create two Book pointers to your Books from # 7.
    // use the == operator to test if they are equal. What happens?
    // if it succeeds, are these equal?
    //
    // Answer:
    Book *PoB1 = &B2, *PoB2 = &B4;

    if (*PoB1 == *PoB2){
        std::cout << "value comparison: equal" << std::endl;
    }else{
        std::cout << "value comparison: unequal" << std::endl;
    }

    // 10) Add a void Donate(Book b, int num_copies) method to your Library class.
    // your Library should add num_copies of Book b to its shelf. 


    // 11) Finally, if you reach this far, work on finding a solution to making it so
    // that you would be able to do any of the comparisons from # 7, 8, and 9
}
