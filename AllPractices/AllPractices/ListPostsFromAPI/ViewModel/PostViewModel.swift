//
//  PostViewModel.swift
//  AllPractices
//
//  Created by mahalakshmi.s46 on 2024-01-12.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var post: [Post] = []
    let networkManager = NetworkServiceManager()
    
    func fetchPosts() {
        self.networkManager.fetchData(from: APIEndpoints.fetchPosts, decodingType: [Post].self) { result in
            switch result {
            case .success(let response):
                self.post = response
            case .failure(let error):
                print("Error in fetching data \(error)")
                break
            }
        }
    }
}
