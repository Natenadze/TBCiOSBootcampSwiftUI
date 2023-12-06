//
//  PersonDetailViewModel.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI
import PhotosUI

@MainActor
final class PersonDetailViewModel: ObservableObject {
    
    @Published private(set) var selectedImage: Image?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    // MARK: - Methods
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let image = UIImage(data: data) {
                    selectedImage = Image(uiImage: image)
                    return
                }
            }
        }
    }
}
