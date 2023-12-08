//
//  ToDoViewModel.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import Foundation

@Observable
class ToDoViewModel {
    
    var allToDo: [ToDoModel] = ToDoModel.initial
    
    var completedTasksCount: Int {
        allToDo.filter { $0.isCompleted }.count
    }
    
    var unCompletedTasksCount: Int {
        allToDo.filter { !$0.isCompleted }.count
    }
    
    var progressValue: Float {
        Float(completedTasksCount) / Float(allToDo.count)
     }
     
     var progressPercent: Int {
         Int(progressValue * 100)
     }
    
    
    // MARK: - Methods
    func updateItem(task: ToDoModel) {
        if let index = allToDo.firstIndex(where: { $0.id == task.id}) {
            allToDo[index] = task.updateCompletion()
        }
    }
    
    func completeAll() {
        allToDo = allToDo.map { $0.complete() }
    }

}
