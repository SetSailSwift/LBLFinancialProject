//
//  CommentsViewModel.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/2/23.
//

import Foundation

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    private let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
    
    init() {
        getComments()
    }
    
    func getComments() {
        Task {
            do {
                let retrievedComments: [Comment] = try await NetworkManager().fetchComments(from: urlString)
                DispatchQueue.main.sync {
                    comments = retrievedComments
                }
            } catch {
                print(error)
            }
        }
    }
}
