#include <iostream>
#include <iomanip>
#include </home/azkadev/Music/test/json.hpp>

using json = nlohmann::json;
using namespace std;


class JSON
{
public:
    template<class TYPE>
    void stringify(TYPE value, int space = 2)
    {

        std::cout << std::setw(space) << value << '\n';
    }
};

int main()
{
    JSON jsonjs;
    // create a JSON object
    json j =
        {};

    // add new values
    j["new"]["key"]["value"] = {"another", "list"};

    j["azka"] = "baru";
    j["azka"] = "ganti";
    j["object"] = {"azka", "oke kan"};

    // count elements
    auto s = j.size();
    j["size"] = s;

    // pretty print with indent of 4 spaces
    jsonjs.stringify(j);
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