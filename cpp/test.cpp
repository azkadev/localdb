#include <iostream>
#include <iomanip>
#include </home/azkadev/Music/test/json.hpp>
#include <fstream>
#include <typeinfo>
#include <bits/stdc++.h>

using jsondb = nlohmann::json;
using namespace std;

class OBJECT
{
public:
    template <class TYPE>
    void stringify(TYPE value, TYPE replacer = nullptr, int space = 2)
    {
        cout << setw(space) << value << '\n';
    }

    template <class TYPE>
    void strinify(TYPE value, TYPE replacer = nullptr, int space = 2)
    {
        return setw(space) << value << '\n';
    }
    string test(){
        return "Azka";
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
    OBJECT JSON;
    CONSOLE console;
    // create a JSON object
    jsondb json = {};

    ofstream MyFile("/home/azkadev/Desktop/localdb/filename.json");

    // add new values
    json["new"]["key"]["value"] = {"another", "list"};

    json["azka"] = "baru";
    json["azka"] = "ganti";
    json["object"] = {"azka", "oke kan"};

    // count elements
    auto s = json.size();
    json["size"] = s;

    MyFile << setw(2) << json << '\n';

    // Close the file
    MyFile.close();
    return 0;
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