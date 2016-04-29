# new makefile
CC=gcc
CFLAGS=-g
LDFLAGS=

OBJ_DIR=bin

BINARY=$(OBJ_DIR)/myprog
INPUTS=main.c input.c
OBJS=$(addprefix $(OBJ_DIR)/, $(INPUTS:.c=.o))

.PHONY: all install  clean

all: $(BINARY) $(OBJS)

depend_clean:
	@echo "" > .depends
	make clean

depend: depend_clean
	make $(OBJS) EXTRA_FLAGS="-MM >> .depends"

$(BINARY): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^
	@echo "Build successful!"

$(OBJ_DIR)/%.o: %.c $(DEPS)
	@test -d $(OBJ_DIR) || mkdir $(OBJ_DIR)
ifdef EXTRA_FLAGS
	$(CC) $< $(EXTRA_FLAGS)
else
	$(CC) -c -o $@ $< $(CFLAGS)
endif

clean:
	rm -f $(BINARY) $(OBJS)

install:
	sudo cp $(OBJ_DIR)/$(BINARY) /usr/bin/
	sudo chmod 555 $(OBJ_DIR)/$(BINARY)

sinclude .depends
