//
//  ToDoView.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import SwiftUI


struct ToDoMainView: View {
    
    // MARK: - Properties
    
    let viewModel = ToDoViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                topHorizontalStack
                completeALLButton
                progressView
                tasksList
            }
        }
    }
    
}

// MARK: - Extension topHorizontalStack
extension ToDoMainView {
    
    var topHorizontalStack: some View {
        HStack {
            Text("You have \(viewModel.unCompletedTasksCount) tasks to complete")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Image("joni")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(.circle)
                .overlay(alignment: .bottomTrailing) {
                    Text("\(viewModel.unCompletedTasksCount)")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .frame(width: 20, height: 20)
                        .background(.orange)
                        .clipShape(Circle())
                }
        }
    }
}

// MARK: - Extension completeALLButton
extension ToDoMainView {
    
    var completeALLButton: some View {
        Button("Complete All") {
            viewModel.completeAll()
        }
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(colors: [.start, .finish], startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

// MARK: - Extension progressView
extension ToDoMainView {
    
    var progressView: some View {
        ProgressView(progressValue: viewModel.progressValue,
                     progressPercent: viewModel.progressPercent,
                     completedTasks: "\(viewModel.completedTasksCount)")
    }
}

// MARK: - Extension tasksList

extension ToDoMainView {
    var tasksList: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                completedTasks
                unCompletedTasks
            }
        }
    }
    
    
    var completedTasks: some View {
        Section(header: Text("Completed Tasks")
            .foregroundColor(.white)
            .font(.title)
        ) {
            if viewModel.completedTasksCount > 0 {
                ForEach(viewModel.allToDo.filter { $0.isCompleted }) { task in
                    TaskView(task: task)
                        .onTapGesture {
                            withAnimation { viewModel.updateItem(task: task) }
                        }
                }
            }else {
                emptyText
            }
        }
    }    
    
    var unCompletedTasks: some View {
        Section(header: Text("Uncompleted Tasks")
            .foregroundColor(.white)
            .font(.title)
        ) {
            if viewModel.unCompletedTasksCount > 0 {
                ForEach(viewModel.allToDo.filter { !$0.isCompleted }) { task in
                    TaskView(task: task)
                        .onTapGesture {
                            withAnimation { viewModel.updateItem(task: task) }
                        }
                }
            }else {
                emptyText
            }
        }
    }
    
}

// MARK: - extension emptyText
extension ToDoMainView {
    
    var emptyText: some View {
        Text("Empty")
            .foregroundStyle(.gray)
            .font(.title2)
            .padding(6)
            .padding(.horizontal)
            .background(.taskView)
    }
}


// MARK: - Preview
#Preview {
    ToDoMainView()
}


