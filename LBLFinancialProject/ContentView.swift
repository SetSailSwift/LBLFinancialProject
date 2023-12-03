//
//  ContentView.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var commentViewModel = CommentsViewModel()
    
    var body: some View {
        List(commentViewModel.comments) { comment in 
            Cell(comment: comment)
        }
    }
}

#Preview {
    ContentView()
}
