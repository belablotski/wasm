# Simple WebAssembly Hello World Makefile

CC = emcc
CFLAGS = -O0 -g3 -s WASM=1 -s EXPORTED_RUNTIME_METHODS="['ccall', 'cwrap']" -s EXPORTED_FUNCTIONS="['_main', '_hello', '_add', '_malloc', '_free']" -s NO_EXIT_RUNTIME=1 -s ALLOW_MEMORY_GROWTH=1 -s ASSERTIONS=1 -s FORCE_FILESYSTEM=0 -s EXPORT_ALL=1
SRC = src/main.c
TARGET = build/hello.js

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p build
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf build/*

.PHONY: all clean