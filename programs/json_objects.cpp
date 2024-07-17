#include <iostream>
#include <fstream>
#include "json.hpp"
#include <ctime>

using json = nlohmann::json;

//this program creates 50 json Employee objects
int main() {
    json entities = json::array();

    for (int i = 0; i < 50; ++i) {
        json entity = {
            {"employeeId", 20 + i},
            {"employeeName", "Employee" + std::to_string( + i)},
            {"compensation", 10000 + i},
            {"email", "emp" + std::to_string(0 + i)+"@gmail.com"},
            {"phoneNo", "12345670"+std::to_string(0+i)},
            {"DOB", 381484800400 + i}
        };
        entities.push_back(entity);
    }

    json result = {{"entity", entities}};

    std::ofstream file("entities.json");
    if (file.is_open()) {
        file << result.dump(4); // Pretty print with 4 space indentation
        file.close();
        std::cout << "JSON file generated successfully!" << std::endl;
    } else {
        std::cerr << "Unable to open file for writing" << std::endl;
    }

    return 0;
}