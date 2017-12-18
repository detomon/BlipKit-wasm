CC = emcc

NAME = blipkit
MODULE_NAME = BlipKit
TARGET_MAIN = $(NAME).js
TARGETS_ALL = $(TARGET_MAIN) $(TARGET_MAIN:%.js=%.wasm)

SRC = BlipKit/src
SOURCES = $(NAME).c
SOURCES += $(wildcard $(SRC)/*.c)

EXPORTS = ["_main"]
RUNTIME_EXPORTS = ["ccall","cwrap"]

CFLAGS = -O2 -Wall -I./$(SRC)
OTHER_FLAGS = \
	-s WASM=1 \
	-s NO_EXIT_RUNTIME=1 \
	-s EXPORTED_FUNCTIONS='$(EXPORTS)' \
	-s EXPORTED_RUNTIME_METHODS='$(RUNTIME_EXPORTS)' \
	-s EXPORT_NAME="'$(MODULE_NAME)'"
ALL_FLAGS = $(CFLAGS) $(OTHER_FLAGS)

.PHONY: clean

all: $(TARGETS_ALL)

$(TARGETS_ALL): $(SOURCES)
	$(CC) $(ALL_FLAGS) -o $(TARGET_MAIN) $(SOURCES)

clean:
	rm -f $(TARGETS_ALL)
