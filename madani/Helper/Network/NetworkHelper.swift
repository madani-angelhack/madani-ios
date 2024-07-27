//
//  NetworkHelper.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import Combine

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: URL, type: T.Type) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
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
}
