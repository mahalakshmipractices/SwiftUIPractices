//
//  NetworkServiceManager.swift
//  AllPractices
//
//  Created by mahalakshmi.s46 on 2024-01-12.
//

import Foundation
import Combine

struct APIEndpoints {
    static let fetchPosts = "https://jsonplaceholder.typicode.com/posts"
}


class NetworkServiceManager {
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchData<T: Decodable>(from target: String, decodingType: T.Type, handleResult: @escaping(Result<T, Error>) -> Void) {
        guard let targetURL = URL(string: target) else { return }
        
        URLSession.shared.dataTaskPublisher(for: targetURL)
            .map(\.data)
            .decode(type: decodingType, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    handleResult(.failure(error))
                }
            }, receiveValue: { result in
                handleResult(.success(result))
            })
            .store(in: &cancellables)
    }
    
}
