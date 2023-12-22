//
//  DragGesture.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct DragGestureView: View {
    
    // MARK: - Properties
    @State var offsetSize = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { offsetSize = $0.translation }
            .onEnded { _ in
                withAnimation {
                    offsetSize = CGSize.zero
                }
            }
       }
    
    
    // MARK: - body
    var body: some View {
        Image("4")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .offset(offsetSize)
            .gesture(drag)
    }
}

#Preview {
    DragGestureView()
}


 
