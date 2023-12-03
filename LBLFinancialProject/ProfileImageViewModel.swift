//
//  ProfileImageViewModel.swift
//  LBLFinancialProject
//
//  Created by Jake Sims on 12/2/23.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileImageViewModel: ObservableObject {
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                let progress = loadTransferrable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
            
        }
    }
    @Published private(set) var imageState: ImageState = .empty
    
    enum ImageState {
        case empty, loading(Progress), success(Image), failure(Error)
    }
    
    private func loadTransferrable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: Image.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else { return }
                switch result {
                case .success(let image?):
                    self.imageState = .success(image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
}
