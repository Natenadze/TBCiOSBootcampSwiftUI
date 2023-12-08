//
//  ProgressView.swift
//  A33ToDo
//
//  Created by Davit Natenadze on 08.12.23.
//

import SwiftUI


struct ProgressView: View {
    
    // MARK: - properties
    @State private var progressValue: Float = 0.5
    @State private var progressPercent = 50
    @State private var completedTasks = "3/6"
    
    // MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Progress")
                .foregroundStyle(.white)
                .font(.title)
            
            VStack(alignment: .leading,spacing: 10) {
                Text("Daily Task")
                    .foregroundStyle(.white)
                    .font(.title3) 
                
                Text("\(completedTasks) Task Completed")
                    .foregroundStyle(.white)
                    .font(.title3)
                
                HStack {
                    Text("keep working")
                    Spacer()
                    Text("\(progressPercent)%")
                        .padding(.trailing)
                }
                
                ProgressBar(progress: $progressValue)
                    .frame(height: 10)
                    
            }
            .padding()
            .background(.taskView)
        }
       
    }
}

// MARK: - Progress Bar
struct ProgressBar: View {
    @Binding var progress: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 15)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .clipShape(Capsule())

                Rectangle()
                    .frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: 15)
                    .foregroundColor(Color.start)
                    .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    ProgressView()
        .preferredColorScheme(.dark)
}
