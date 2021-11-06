#include <iostream>
#include <iomanip>
#include </home/azkadev/Music/test/json.hpp>
#include <fstream>
#include <typeinfo>
#include<bits/stdc++.h>

using json = nlohmann::json;
using namespace std;

class JSON
{
public:
    template <class TYPE>
    void stringify(TYPE value, int space = 2)
    {
        cout << setw(space) << value << '\n';
    }
    template <class TYPE>
    void strinify(TYPE value, int space = 2)
    {
        return setw(space) << value << '\n';
    }
};

class CONSOLE
{
public:
    template <class TYPE>
    void log(TYPE value = "")
    {
        cout << value << "\n";
    }
};

int main()
{
    JSON jsonjs;
    CONSOLE console;
    // create a JSON object
    json j = {};

    ofstream MyFile("filename.json");

    // add new values
    j["new"]["key"]["value"] = {"another", "list"};

    j["azka"] = "baru";
    j["azka"] = "ganti";
    j["object"] = {"azka", "oke kan"};

    // count elements
    auto s = j.size();
    j["size"] = s;

    // pretty print with indent of 4 spaces
    jsonjs.stringify("azkakzkaza");

    int n = 36;
    char c = 'A';
    double d = 1.2;
    if(*(typeid(n).name()) == 'i'){
        cout << "I am an Integer variable" << endl;
    }
    if(*((char *) typeid(d).name()) == 'd'){
        cout << "I am a Double variable" << endl;
    }
    if(*((char *) typeid(c).name()) == 'c'){
        cout << "I am a Char variable" << endl;
    }

    // Write to the file
    MyFile << setw(2) << j << '\n';

    // Close the file
    MyFile.close();
}

/*
int main()
{
    // create a JSON object
    json j =
    {
        {"pi", 3.141},
        {"happy", true},
        {"name", "Niels"},
        {"nothing", nullptr},
        {
            "answer", {
                {"everything", 42}
            }
        },
        {"list", {1, 0, 2}},
        {
            "object", {
                {"currency", "USD"},
                {"value", 42.99}
            }
        }
    };

    // add new values
    j["new"]["key"]["value"] = {"another", "list"};

    // count elements
    auto s = j.size();
    j["size"] = s;

    // pretty print with indent of 4 spaces
    std::cout << std::setw(4) << j << '\n';
}
*/