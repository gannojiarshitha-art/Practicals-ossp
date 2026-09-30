CC = gcc
CFLAGS = -Wall -g

prog1: prog1.c
	$(CC) $(CFLAGS) -o prog1 prog1.c

prog2: prog2.c
	$(CC) $(CFLAGS) -o prog2 prog2.c

process: process.c
	$(CC) $(CFLAGS) -o process process.c

clean:
	rm -f prog1 prog2 process
