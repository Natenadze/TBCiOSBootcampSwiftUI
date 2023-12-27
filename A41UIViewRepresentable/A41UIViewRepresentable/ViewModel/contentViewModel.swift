//
//  contentViewModel.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import Foundation
import NatenWorking

class ContentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allNews = [Articles]()
    let key = "Put your api key here"
    
    // MARK: - init
    init() { fetchNews() }
    
    // MARK: - Methods
    func fetchNews() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(key)"
        Task {
            if let news: News = try await NetworkManager().performURLRequest(url) {
                await MainActor.run { allNews = news.articles }
            }
        }
    }
}

