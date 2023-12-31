//
//  NetworkManager.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/2/23.
//

import Foundation

/// Generic Network Manager
/// Source: https://medium.com/devtechie/generic-network-manager-using-async-await-task-in-swiftui-6fd746fb4b83
struct NetworkManager {
    
    func fetch<T: Codable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }
}
