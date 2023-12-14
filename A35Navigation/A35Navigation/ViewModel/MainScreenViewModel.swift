//
//  MainScreenViewModel.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import Foundation
import NatenWorking

final class MainScreenViewModel: ObservableObject {
    
    @Published var destinations = [City]()
    
    // MARK: - Init
    init() {
        fetchDestinations()
    }
    
    // MARK: - Methods
    func fetchDestinations() {
        let url = "https://mocki.io/v1/53d75627-2756-4692-a3d6-6951c9b623df"
        Task {
            if let fetchedData: Destination = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    destinations = fetchedData.destinations
                }
            }
        }
    }
    
}
