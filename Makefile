CC = gcc
CFLAGS = -g -std=c17
GRADER = grader

.PHONY: all clean

all: $(GRADER)

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c $<

$(GRADER): main.o $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm *.o $(GRADER)