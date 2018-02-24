// To parse the JSON, add this file to your project and do:
//
//   let reddit = try Reddit(json)

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

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
