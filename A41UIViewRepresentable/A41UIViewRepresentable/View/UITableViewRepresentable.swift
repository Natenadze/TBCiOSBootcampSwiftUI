//
//  UITableViewRepresentable.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import SwiftUI

struct UITableViewRepresentable: UIViewRepresentable {
    
    // MARK: - properties
    var newsTitles: [String]
    var fontSize: CGFloat
    
    // MARK: - init
    init(newsTitles: [String], fontSize: CGFloat) {
        self.newsTitles = newsTitles
        self.fontSize = fontSize
    }

    // MARK: - methods
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
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: UITableViewRepresentable
    
        init(parent: UITableViewRepresentable) {
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
    }
}
