# Compiler
CC = gcc

# Compiler flags
CFLAGS = -std=c17 -Wall -Wextra

all: clean main.o debug.o chunk.o memory.o value.o
	$(CC) -o main main.o debug.o chunk.o memory.o value.o $(CFLAGS)

main.o: main.c chunk.h common.h debug.h
	$(CC) -c main.c

debug.o: debug.c debug.h value.h
	$(CC) -c debug.c

chunk.o: chunk.c chunk.h memory.h
	$(CC) -c chunk.c

memory.o: memory.c memory.h
	$(CC) -c memory.c

value.o: value.c memory.h value.h
	$(CC) -c value.c

clean:
	rm -f main main.o debug.o chunk.o memory.o value.o