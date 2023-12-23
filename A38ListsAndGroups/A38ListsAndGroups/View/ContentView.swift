//
//  ContentView.swift
//  A38ListsAndGroups
//
//  Created by Davit Natenadze on 20.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var newsTitle = ""
    @State var newsBody = ""
    @State private var newsList = [News]()
    @State private var date = Date()
    
    
    // MARK: - body
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.cyan, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            
            VStack(spacing: 20) {
                titleTextField
                datePickerView
                titleBody
                saveButton
                listView
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Methods
    func delete(for index: IndexSet) {
        newsList.remove(atOffsets: index)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        newsList.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func clearTextFields() {
        newsTitle.removeAll()
        newsBody.removeAll()
    }
    func updateNewsList() {
        let news = News(title: newsTitle, body: newsBody, date: date)
        newsList.append(news)
    }
}

extension ContentView {
    
    private var titleTextField: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Choose title")
                .font(.title2)
                .padding(.leading, 8)
            
            TextField("News title", text: $newsTitle)
                .frame(height: 50)
                .padding(.leading, 8)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8))
                .autocorrectionDisabled()
        }
    }
    
    private var titleBody: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Enter news")
                .font(.title2)
                .padding(.horizontal)
            
            TextEditor(text: $newsBody)
                .frame(height: 100)
                .clipShape(.rect(cornerRadius: 8))
                .autocorrectionDisabled()
        }
    }
    
    private var datePickerView: some View {
        HStack {
            DatePicker("Select date:", selection: $date)
                .background(.white)
                .font(.title2)
                .clipShape(.rect(cornerRadius: 8), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
        }
    }
    
    private var saveButton: some View {
        Button("Save") {
            updateNewsList()
            clearTextFields()
        }
        .frame(width: 100, height: 44)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 8))
        .disabled(newsTitle.count < 2 || newsBody.count < 2)
    }
    
    private var listView: some View {
        VStack(alignment: .trailing) {
            EditButton()
                .foregroundStyle(.white)
                .font(.title2)
                .offset(y: 10.0)
            
            if newsList.count > 0 {
                List {
                    ForEach (newsList) { news in
                        NewsCellView(news: news)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .clipShape(.rect(cornerRadius: 8))
                .frame(height: 300)
            }else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white)
                    Text("There is no news to show")
                }
            }
            
        }
    }
    
}


#Preview {
    ContentView()
}
