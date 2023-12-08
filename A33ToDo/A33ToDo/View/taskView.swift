//
//  taskView.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import Foundation
import SwiftUI

struct taskView: View {
    
    // MARK: - Properties
    let task: ToDoModel
    
    
    // MARK: - body
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 15, height: 80)
                .foregroundStyle(task.isCompleted ? .completed : .uncompleted)
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.title3)
                
                HStack {
                    Image(systemName: "calendar")
                    Text(task.date)
                }
            }
            .foregroundStyle(.white)
            
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill": "circle")
                .resizable()
                .frame(width: 26, height: 26)
                .foregroundStyle(task.isCompleted ? .purple : .purple)
                .padding(.horizontal)
        }
        .background(.taskView)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}



// MARK: - Preview
#Preview {
    Group {
        taskView(task: .init(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true))
        taskView(task: .init(title: "Prepare Research", date: "12 Nov", isCompleted: false))
    }
}
