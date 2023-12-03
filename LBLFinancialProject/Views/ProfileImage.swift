//
//  ProfileImage.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/2/23.
//

import PhotosUI
import SwiftUI

struct ProfileImage: View {
    @ObservedObject var viewModel: ProfileImageViewModel
    @Binding var orientation: UIDeviceOrientation
    
    var size: CGFloat {
        orientation == .portrait || orientation == .unknown ? 50 : 75
    }
    
    var body: some View {
        PhotosPicker(selection: $viewModel.imageSelection, matching: .images, photoLibrary: .shared()) {
            BaseProfileImage(imageState: viewModel.imageState, orientation: orientation)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .background {
                    Circle().fill(Color.gray)
                }
        }
    }
}

struct BaseProfileImage: View {
    let imageState: ProfileImageViewModel.ImageState
    let orientation: UIDeviceOrientation
    
    var size: CGFloat {
        orientation == .portrait || orientation == .unknown ? 25 : 50
    }
    
    var body: some View {
        switch imageState {
        case .empty:
            Image(systemName: "person.fill")
                .font(.system(size: size))
                .foregroundColor(.white)
        case .loading:
            ProgressView()
        case .success(let image):
            image.resizable().scaledToFill()
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: size))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ProfileImage(viewModel: ProfileImageViewModel(), orientation: .constant(.unknown))
}
