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
    let isCompleted: Bool
    
    
    // MARK: - Init
    init(title: String, date: String, isCompleted: Bool = false) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
    
    // MARK: - Methods

}
