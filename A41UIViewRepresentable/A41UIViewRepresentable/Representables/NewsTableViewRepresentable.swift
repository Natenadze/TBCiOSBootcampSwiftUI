//
//  NewsTableViewRepresentable.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import SwiftUI

// ცალკეულ ფოლდერში და ფაილში იმიტომ გამოვიტანე რომ შეიძლება reusable იყოს, სხვა გვერდებზეც იგივე თეიბლი დაიხატოს სხვა ინფორმაციით. მაგ ფავორიტები, მაგრამ თქვენ თუ პროექტში მარტო ერთგან გამოიყენებთ მაშინ არაა საჭირო გატანა, ასე მაგალითისთვის გავაკეთე.
struct NewsTableViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var newsTitles: [String]
    var fontSize: CGFloat
    var onSelect: (String) -> Void
    
    // MARK: - Init
    init(newsTitles: [String], fontSize: CGFloat, onSelect: @escaping (String) -> Void) {
        self.newsTitles = newsTitles
        self.fontSize = fontSize
        self.onSelect = onSelect
    }
    
    // MARK: - Methods
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.parent = self
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    // MARK: - Coordinator
    final class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: NewsTableViewRepresentable
        
        init(parent: NewsTableViewRepresentable) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.newsTitles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = parent.newsTitles[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = .systemFont(ofSize: parent.fontSize)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            parent.onSelect(parent.newsTitles[indexPath.row])
        }
    }
}
