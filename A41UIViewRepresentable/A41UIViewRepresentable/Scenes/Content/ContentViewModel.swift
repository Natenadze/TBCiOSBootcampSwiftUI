//
//  ContentViewModel.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import SwiftUI
import NatenWorking

final class ContentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allNews = [Articles]()
    @Published var selectedNews: Articles?
    @Published var newsSelected = false
    
    private let key = "Put ur api key here"
    
    // MARK: - Init
    init() {
        fetchNews()
    }
    
    // MARK: - Methods
    func newsSelected(_ newsTitle: String) {
        selectedNews = allNews.first { $0.title == newsTitle }
        newsSelected = true
    }
    
    private func fetchNews() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(key)"
        Task {
            if let news: News = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allNews = news.articles
                }
            }
        }
    }
}

