// To parse the JSON, add this file to your project and do:
//
//   guard let reddit = try Reddit(json) else { ... }

import Foundation

struct Reddit: Codable {
    let message: String
    let error: Int
}

// MARK: Convenience initializers

extension Reddit {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Reddit.self, from: data)
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }

    init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}
