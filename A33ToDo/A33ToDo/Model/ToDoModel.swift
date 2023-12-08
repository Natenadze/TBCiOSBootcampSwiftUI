//
//  ToDoModel.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import Foundation


struct ToDoModel: Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    let title: String
    let date: String
    var isCompleted: Bool
    
    
    // MARK: - Init
    init(title: String, date: String, isCompleted: Bool = false) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
    
    // MARK: - Methods
    func updateCompletion() -> ToDoModel {
        ToDoModel(title: title, date: date, isCompleted: !isCompleted)
    }
    
    func complete() -> ToDoModel {
        ToDoModel(title: title, date: date, isCompleted: true)
    }

}

extension ToDoModel {
    static var initial = [
        ToDoModel(title: "todo number 1", date: "yesterday"),
        ToDoModel(title: "todo number 2", date: "today"),
        ToDoModel(title: "todo number 3", date: "12 Nov"),
        ToDoModel(title: "todo number 4", date: "4 Oct"),
        ToDoModel(title: "todo number 5", date: "17 Jan"),
        ToDoModel(title: "todo number 6", date: "13 Mar"),
    ]
}
