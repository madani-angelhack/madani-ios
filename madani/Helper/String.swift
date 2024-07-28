import Foundation

extension String {
    func decode<T: Decodable>(_ type: T.Type) -> T? {
        guard let data = self.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data)
    }
    
    static func encode<T: Encodable>(_ value: T) -> String? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(value) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
