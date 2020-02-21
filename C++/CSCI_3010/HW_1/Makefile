CXX = g++
CXXFLAGS	= -std=c++17 -Wall

all: maze

clean:
	rm Player.o Maze.o maze

maze: Player.o Maze.o Main.cpp
	$(CXX) $(CXXFLAGS) Main.cpp Player.o Maze.o -o maze

Player.o: Player.cpp
	$(CXX) $(CXXFLAGS) -c Player.cpp

Maze.o: Maze.cpp
	$(CXX) $(CXXFLAGS) -c Maze.cpp
