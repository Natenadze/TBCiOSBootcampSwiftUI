//
//  MainScreenViewModel.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import Foundation
import NatenWorking

final class MainScreenViewModel: ObservableObject {
    
    @Published var destinations = [Destination]()
    
    // MARK: - Init
    init() {
        fetchDestinations()
    }
    
    // MARK: - Methods
    func fetchDestinations() {
        let url = "https://mocki.io/v1/797843c2-fba3-41c0-831a-55eade0d9f04"
        Task {
            if let fetchedData: [Destination] = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    destinations = fetchedData
                }
            }
        }
    }
    
}
