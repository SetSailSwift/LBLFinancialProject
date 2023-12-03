//
//  Cell.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/1/23.
//

import SwiftUI

struct Cell: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @StateObject var viewModel = ProfileImageViewModel()
    let comment: Comment
    
    var body: some View {
        Group {
            if orientation.isLandscape {
                // Landscape
                HStack(spacing: 5) {
                    VStack {
                        ProfileImage(viewModel: viewModel, orientation: $orientation)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(comment.name ?? "Anonymous")
                                .fontWeight(.semibold)
                            Spacer()
                            Text(comment.email ?? "N/A")
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("#\(comment.id)")
                            Spacer()
                        }
                        Text(comment.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            } else {
                // Portrait
                HStack {
                    VStack(spacing: 5) {
                        ProfileImage(viewModel: viewModel, orientation: $orientation)
                        Text(comment.name ?? "Anonymous")
                            .font(.system(size: 10))
                        Text(comment.email ?? "N/A")
                            .font(.system(size: 10))
                        Text("#\(comment.id)")
                            .font(.system(size: 10))
                    }
                    .frame(width: 75)
                    Divider()
                    Text(comment.body)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 13))
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Cell(comment: Comment(id: 1, name: "Peter Parker", email: "spiderman@avengers.com", body: "This Spider-man fella is helping out the city so much. In a world where crime runs rampant and NYC is burning to the ground....."))
}
