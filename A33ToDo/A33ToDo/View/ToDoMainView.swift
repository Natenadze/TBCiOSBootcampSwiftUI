//
//  ToDoView.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import SwiftUI


/*
 ტექსტურად აჩვენეთ რამდენი დავალება დარჩა შესასრულებელი
 პროფილის ფოტოზე აჩვენეთ შესასრულებელი დავალებების რაოდენობა
 პროგრესის მაჩვენებელი ვიუ Optional არის
 complete all შეასრულებს ყველა ტასკს
 სიაში ზემოთ იყოს შესრულებულები
 ქვემოთ შესასრულებლები .
 შესაძლებელი იყოს შესრულებულის განიშვნაც.
 გამოიყენეთ 2 @State მასივი და ყველაფერი ვიუს ფაილშივე გქონდეთ, ViewModel კომუნიკაციები არ გინდათ.
  
 - Optional
 აპლიკაციაში იყოს 2 სექცია შესრულებულების და შესასრულებელი დავალებების ცალკე სექციებად (ეს გასარჩევი გექნებათ როგორ უნდა გაკეთდეს)
 პლიუს ერთი ზემოთ უკვე ვთქვი: - პროგრესის მაჩვენებელი ვიუ
 */


struct ToDoMainView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("You have 3 tasks to complete")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image("joni")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                        .overlay(alignment: .bottomTrailing) {
                            Text("3")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 15, height: 15)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                }
                
                Button("Complete All") {
                   //TODO: - ???
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
                
                ProgressView()
                
                TaskView(task: .init(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true))
                TaskView(task: .init(title: "Prepare Research", date: "12 Nov", isCompleted: false))   
                TaskView(task: .init(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true))
                TaskView(task: .init(title: "Prepare Research", date: "12 Nov", isCompleted: false))
            }
            
        }
        
    }
    
}

// MARK: - Preview
#Preview {
    ToDoMainView()
}
