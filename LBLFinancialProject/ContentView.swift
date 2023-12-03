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
        // Placed into a NavigationStack for the intention that as the app
        // grows, we'd more than likely navigation to another view when a cell
        // is selected. Also to enable the navigation title.
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(commentViewModel.comments) {
                        Cell(comment: $0)
                        Divider()
                    }
                }
            }
            .navigationTitle("Comments")
            .padding(.horizontal)
        }
        
        // Disabled using list temporarily as pressing the entire cell
        // would invoke the PhotosPicker, when it should just occur when
        // the image is tapped.
//        List(commentViewModel.comments) { comment in
//            Cell(comment: comment)
//        }
    }
}

#Preview {
    ContentView()
}
