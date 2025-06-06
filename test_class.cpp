#include <iostream>

class TestClass {
public:
    TestClass() {}
    ~TestClass() {}
    void test() { std::cout << "Test" << std::endl; }
};

int main() {
    TestClass t;
    t.test();
    return 0;
}
