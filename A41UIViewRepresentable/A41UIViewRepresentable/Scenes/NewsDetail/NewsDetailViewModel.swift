//
//  NewsDetailViewModel.swift
//  A41UIViewRepresentable
//
//  Created by Nana Jimsheleishvili on 01.01.24.
//

import SwiftUI
import Combine

// MARK: - NewsDetailViewModelDelegate
protocol NewsDetailViewModelDelegate: AnyObject {
    func imageFetched(_ image: UIImage?)
}

// MARK: - NewsDetailViewModelProtocol
protocol NewsDetailViewModelProtocol {
    var article: Articles { get }
    var image: UIImage? { get set }
    var delegate: NewsDetailViewModelDelegate? { get set }
    func viewDidLoad()
    func formattedDate() -> String
}

// MARK: - NewsDetailViewModel
final class NewsDetailViewModel: NewsDetailViewModelProtocol {
    // MARK: - Properties
    var article: Articles
    var image: UIImage?
    
    weak var delegate: NewsDetailViewModelDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(article: Articles) {
        self.article = article
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        loadImage()
    }
    
    func formattedDate() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        if let publishedAt = article.publishedAt, let date = formatter.date(from: publishedAt) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "MMM d, yyyy, h:mm a"
            return displayFormatter.string(from: date)
        }
        return ""
    }
    
    private func loadImage() {
        // შეგიძლიათ თქვენი Network Layer-ი გამოიყენოთ
        guard let urlToImage = article.urlToImage,
              let imageUrl = URL(string: urlToImage)
        else { return }
        
        URLSession.shared.dataTaskPublisher(for: imageUrl)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.delegate?.imageFetched($0) }
            .store(in: &cancellables)
    }
}
