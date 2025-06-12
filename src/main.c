#include <stdio.h>
#include <emscripten.h>

// Export functions explicitly
EMSCRIPTEN_KEEPALIVE
void hello() {
    printf("Hello from WebAssembly!\n");
}

EMSCRIPTEN_KEEPALIVE  
int add(int a, int b) {
    printf("Adding %d + %d\n", a, b);
    return a + b;
}

// Force the functions to be included by calling them from main
int main() {
    printf("WebAssembly module loaded successfully!\n");
    
    // Call the functions to ensure they're linked
    hello();
    printf("2 + 3 = %d\n", add(2, 3));
    
    // Also register them explicitly for emscripten
    EM_ASM({
        if (typeof Module !== 'undefined') {
            Module._hello = Module._hello || _hello;
            Module._add = Module._add || _add;
        }
    });
    
    return 0;
}
