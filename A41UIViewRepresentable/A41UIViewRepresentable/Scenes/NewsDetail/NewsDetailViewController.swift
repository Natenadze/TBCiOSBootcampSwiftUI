//
//  NewsDetailView.swift
//  A41UIViewRepresentable
//
//  Created by Nana Jimsheleishvili on 01.01.24.
//

import SwiftUI

final class NewsDetailViewController: UIViewController {
    // MARK: - Properties
    var viewModel: NewsDetailViewModelProtocol?
    
    // MARK: - Components
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, publishedDateLabel, descriptionLabel, contentLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .gray
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        return imageView
    }()
    
    private var titleLabel: UILabel {
        let label = UILabel()
        label.text = viewModel?.article.title
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }
    
    private var publishedDateLabel: UILabel {
        let label = UILabel()
        label.text = "Published on \(viewModel?.formattedDate() ?? "")"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }
    
    private var descriptionLabel: UILabel {
        let label = UILabel()
        label.text = viewModel?.article.description
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }
    
    private var contentLabel: UILabel {
        let label = UILabel()
        label.text = viewModel?.article.content
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        viewModel?.delegate = self
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Setup
    private func setup() {
        setupView()
        setupMainStackView()
    }
    
    private func setupView() {
        title = "News Detail"
        view.backgroundColor = .white
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - NewsDetailViewModelDelegate
extension NewsDetailViewController: NewsDetailViewModelDelegate {
    func imageFetched(_ image: UIImage?) {
        if let image {
            imageView.image = image
            imageView.backgroundColor = .clear
            imageView.setNeedsDisplay()
        }
    }
}
