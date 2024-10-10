#include <iostream>
#include <string>

class Greeting {
public:
    void sayHello(const std::string &name) {
        std::cout << "Hello, " << name << "!" << std::endl;
    }
};

int main() {
    Greeting greeting;
    std::string name;

    std::cout << "Enter your name: ";
    std::getline(std::cin, name);

    greeting.sayHello(name);
    return 0;
}
