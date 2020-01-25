# This is an example make file

CXX = g++  # the compiler
CXXFLAGS = -std=c++17 -Wall  # flags for the compiler

main: main.o Point.o
	$(CXX) $(CXXFLAGS) -o main main.o Point.o

main.o: main.cpp Point.hpp
	$(CXX) $(CXXFLAGS) -c main.cpp 

Point.o: Point.hpp

# runs for "make clean"
clean:
	rm main main.o Point.o   #include all targets here