# Simple WebAssembly Hello World Makefile

CXX = em++
CXXFLAGS = -O0 -g3 -s WASM=1 --bind -s NO_EXIT_RUNTIME=1 -s ALLOW_MEMORY_GROWTH=1 -s ASSERTIONS=1
SRC = src/main.cpp
TARGET = build/hello.js

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p build
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf build/*

.PHONY: all clean