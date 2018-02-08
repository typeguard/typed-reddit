//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Reddit data = nlohmann::json::parse(jsonString);

#include "json.hpp"

namespace quicktype {
    using nlohmann::json;

    struct Reddit {
        std::string message;
        int64_t error;
    };
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
}

namespace nlohmann {

    inline void from_json(const json& _j, struct quicktype::Reddit& _x) {
        _x.message = _j.at("message").get<std::string>();
        _x.error = _j.at("error").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Reddit& _x) {
        _j = json::object();
        _j["message"] = _x.message;
        _j["error"] = _x.error;
    }
}
