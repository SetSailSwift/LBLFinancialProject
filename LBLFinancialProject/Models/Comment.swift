//
//  Comment.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/1/23.
//

import Foundation

struct Comment: Codable, Identifiable {
    var id: Int
    var name: String?
    var email: String?
    var body: String
}
