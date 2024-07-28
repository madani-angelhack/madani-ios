//
//  NetworkHelper.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import Combine
import Firebase

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: URL, type: T.Type) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: url)
        let headers = ["token":"testJWT"]
        headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
        }
        return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { data, response in
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
    func fetchDataListen<T: Decodable>(from path: String, type: T.Type) -> AnyPublisher<[T], Error> {
            let subject = PassthroughSubject<[T], Error>()
            let ref = Database.database().reference().child(path)
            
            ref.observe(.value) { snapshot in
                var items: [T] = []
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                       let dict = snapshot.value as? [String: Any],
                       let data = try? JSONSerialization.data(withJSONObject: dict),
                       let item = try? JSONDecoder().decode(T.self, from: data) {
                        items.append(item)
                    }
                }
                subject.send(items)
            } withCancel: { error in
                subject.send(completion: .failure(error))
            }
            
            return subject.eraseToAnyPublisher()
        }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}
