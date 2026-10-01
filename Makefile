CC = gcc
CFLAGS = -Wall -Wextra

all: prog1 prog2 process wait_waitpid_demo prog5 fifo_server fifo_client signal_handler prog7_linuxaddr memory_demo dynamic_memory cow_demo copy_lowlevel copy_stdio redirect_output redirect_input

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

signal_handler: signal_handler.c
	$(CC) $(CFLAGS) -o signal_handler signal_handler.c

prog7_linuxaddr: prog7_linuxaddr.c
	$(CC) $(CFLAGS) -g -o prog7_linuxaddr prog7_linuxaddr.c

memory_demo: memory_demo.c
	$(CC) $(CFLAGS) -g -o memory_demo memory_demo.c

dynamic_memory: dynamic_memory.c
	$(CC) $(CFLAGS) -g -o dynamic_memory dynamic_memory.c

cow_demo: cow_demo.c
	$(CC) $(CFLAGS) -g -o cow_demo cow_demo.c

copy_lowlevel: copy_lowlevel.c
	$(CC) $(CFLAGS) -O2 -o copy_lowlevel copy_lowlevel.c

copy_stdio: copy_stdio.c
	$(CC) $(CFLAGS) -O2 -o copy_stdio copy_stdio.c

redirect_output: redirect_output.c
	$(CC) $(CFLAGS) -g -o redirect_output redirect_output.c

redirect_input: redirect_input.c
	$(CC) $(CFLAGS) -g -o redirect_input redirect_input.c

clean:
	rm -f prog1 prog2 process wait_waitpid_demo prog5 fifo_server fifo_client signal_handler prog7_linuxaddr memory_demo dynamic_memory cow_demo copy_lowlevel copy_stdio redirect_output redirect_input
