CC = gcc
CFLAGS = -Wall -Wextra

all: prog1 prog2 process wait_waitpid_demo prog5 fifo_server fifo_client

prog1: prog1.c
	$(CC) $(CFLAGS) -o prog1 prog1.c

prog2: prog2.c
	$(CC) $(CFLAGS) -o prog2 prog2.c

process: process.c
	$(CC) $(CFLAGS) -o process process.c

wait_waitpid_demo: wait_waitpid_demo.c
	$(CC) $(CFLAGS) -o wait_waitpid_demo wait_waitpid_demo.c

prog5: prog5.c
	$(CC) $(CFLAGS) -o prog5 prog5.c

fifo_server: fifo_server.c
	$(CC) $(CFLAGS) -o fifo_server fifo_server.c

fifo_client: fifo_client.c
	$(CC) $(CFLAGS) -o fifo_client fifo_client.c

clean:
	rm -f prog1 prog2 process wait_waitpid_demo prog5 fifo_server fifo_client
