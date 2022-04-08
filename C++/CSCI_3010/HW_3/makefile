CXX = g++
CXXFLAGS	= -std=c++17 -Wall

all: election

clean:
	rm election ElectoralMap.o District.o TextUI.o Election.o

election: main.cpp ElectoralMap.o District.o TextUI.o Election.o
	$(CXX) $(CXXFLAGS) main.cpp ElectoralMap.o District.o TextUI.o Election.o -o election

ElectoralMap.o: ElectoralMap.cpp
	$(CXX) $(CXXFLAGS) -c ElectoralMap.cpp

District.o: District.cpp
	$(CXX) $(CXXFLAGS) -c District.cpp
	
TextUI.o: TextUI.cpp
	$(CXX) $(CXXFLAGS) -c TextUI.cpp

Election.o: Election.cpp
	$(CXX) $(CXXFLAGS) -c Election.cpp
