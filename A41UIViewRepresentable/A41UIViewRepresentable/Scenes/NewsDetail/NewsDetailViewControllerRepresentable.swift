//
//  NewsDetailViewControllerRepresentable.swift
//  A41UIViewRepresentable
//
//  Created by Nana Jimsheleishvili on 02.01.24.
//

import SwiftUI
import UIKit

struct NewsDetailViewControllerRepresentable: UIViewControllerRepresentable {
    // MARK: - Properties
    var viewModel: NewsDetailViewModelProtocol
    
    // MARK: - Methods
    func makeUIViewController(context: Context) -> NewsDetailViewController {
        let viewController = NewsDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: NewsDetailViewController, context: Context) { }
}

// MARK: - Preview
struct NewsDetailViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailViewControllerRepresentable(
            viewModel: NewsDetailViewModel(
                article: .init(
                    title: "Preview",
                    description: "Preview",
                    urlToImage: "Preview",
                    content: "Preview",
                    publishedAt: "Preview"
                )
            )
        )
    }
}
