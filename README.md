# WebAssembly Hello World

A simple WebAssembly application demonstrating basic C++ to WASM compilation using Emscripten.

## Project Structure

```
├── src/
│   └── main.cpp          # C++ source code with exported functions
├── web/
│   ├── index.html        # HTML interface for the WASM module
│   ├── hello.js          # Generated JavaScript glue code
│   └── hello.wasm        # Compiled WebAssembly binary
├── build/
│   ├── hello.js          # Build output
│   └── hello.wasm        # Build output
└── Makefile              # Build configuration
```

## Features

- **hello()** - A simple function that prints a greeting
- **add(a, b)** - A function that adds two numbers
- Interactive web interface with buttons to call WASM functions
- Real-time output display

## Building

1. Make sure Emscripten is set up:
   ```bash
   source emsdk/emsdk_env.sh
   ```

2. Build the project:
   ```bash
   make
   ```

3. Copy files to web directory:
   ```bash
   cp build/* web/
   ```

## Running

1. Start a local HTTP server:
   ```bash
   cd web
   python3 -m http.server 8080
   ```

2. Open your browser and navigate to `http://localhost:8080`

## Usage

- Click "Call Hello Function" to call the C++ hello() function
- Click "Test Add Function" to test the add() function with sample numbers
- Click "Clear Output" to clear the output display

## Technical Details

- Compiled with Emscripten
- Uses `EMSCRIPTEN_KEEPALIVE` to export C++ functions to JavaScript
- Functions are called using `Module.ccall()` from the web interface
- Console output is redirected to the web page for better user experience
