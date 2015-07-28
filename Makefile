CC=gcc
CFLAGS=-g
LDFLAGS=-L$(shell pwd)
ASLIB=-shared
CLEANFILES = main libcat.so libdog.so
main:	main.c	libcat.so	libdog.so
	$(CC) $(CFLAGS)	$(LDFLAGS) -o main -lcat -ldog main.c

libcat.so: cat.c
	$(CC) $(CFLAGS) $(ASLIB) -o libcat.so -c cat.c 

libdog.so: dog.c
	$(CC) $(CFLAGS) $(ASLIB) -o libdog.so -c dog.c 

clean :
	rm -f $(CLEANFILES)
