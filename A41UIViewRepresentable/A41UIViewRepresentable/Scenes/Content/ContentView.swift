//
//  ContentView.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = ContentViewModel()
    @State private var selectedFontSize: CGFloat = 16
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            newsList
                .toolbar { toolbarItem() }
                .navigationDestination(isPresented: $viewModel.newsSelected) {
                    if let selectedNews = viewModel.selectedNews {
                        NewsDetailViewControllerRepresentable(viewModel: NewsDetailViewModel(article: selectedNews))
                    }
                }
        }
    }
}

// MARK: - Views
private extension ContentView {
    private var newsList: some View {
        VStack {
            if viewModel.allNews.isEmpty {
                ProgressView().scaleEffect(2.5)
            } else {
                NewsTableViewRepresentable(
                    newsTitles: viewModel.allNews.map(\.title),
                    fontSize: selectedFontSize
                ) { news in
                    viewModel.newsSelected(news)
                }
                .accessibilityLabel("World news list. You have \(viewModel.allNews.count) news Today")
            }
        }
        .navigationTitle("World News")
        .padding()
    }
    
    private func toolbarItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                Button("Small") { selectedFontSize = 10 }
                Button("Medium") { selectedFontSize = 16 }
                Button("Large") { selectedFontSize = 22 }
                Button("XLarge") { selectedFontSize = 28 }
                Button("XXLarge") { selectedFontSize = 32 }
            } label: {
                Label("Font Size", systemImage: "textformat.size")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
