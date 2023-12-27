//
//  ContentView.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - properties
    @StateObject private var viewModel = ContentViewModel()
    @State private var selectedFontSize: CGFloat = 16
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            newsList
                .toolbar { toolbarItem() }
        }
    }
}

// MARK: - Extension Components
private extension ContentView {
    
    var newsList: some View {
        VStack {
            if viewModel.allNews.isEmpty {
                ProgressView().scaleEffect(2.5)
            } else {
                UITableViewRepresentable(newsTitles: viewModel.allNews.map(\.title), fontSize: selectedFontSize)
                    .accessibilityLabel("World news list. You have \(viewModel.allNews.count) news Today")
            }
        }
        .navigationTitle("World News")
        .padding()
    }
    
    func toolbarItem() -> some ToolbarContent {
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


#Preview {
    ContentView()
}
