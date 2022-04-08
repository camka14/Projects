# Makefile for Writing Make Files Example

# *****************************************************
# Variables to control Makefile operation

CC = g++
CFLAGS = -std=c++17 -Wall -g

all: main

# ****************************************************
# Targets needed to bring the executable up to date

main: main.o utils.o cfdsolverstructured.o flux.o cell.o config.o
	$(CC) $(CFLAGS) main.o utils.o cfdsolverstructured.o flux.o cell.o config.o -o main

# The main.o target can be written more simply

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

utils.o: Utils.cpp
	$(CC) $(CFLAGS) -c Utils.cpp

cfdsolverstructured.o: CFDSolverStructured.cpp
	$(CC) $(CFLAGS) -c CFDSolverStructured.cpp

flux.o: Flux.cpp
	$(CC) $(CFLAGS) -c Flux.cpp

cell.o: Cell.cpp
	$(CC) $(CFLAGS) -c Cell.cpp

config.o: Config.cpp
	$(CC) $(CFLAGS) -c Config.cpp

clean:
	rm -f main.o utils.o cfdsolverstructured.o flux.o cell.o config.o *~