//
//  PinchGesture.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct PinchGesture: View {
    
    // MARK: - Properties
    @GestureState private var magnifyBy = 1.0  // New
    @State var magnifyValue: CGFloat = 1.0  // Old
    
    var newMagnification: some Gesture {
        MagnifyGesture()
            .updating($magnifyBy) { value, gestureState, _ in
                    gestureState = value.magnification
            }
    }
    
    var oldMagnification: some Gesture {
        MagnificationGesture()
            .onChanged { number in
                magnifyValue = number
            }
            .onEnded { _ in
                withAnimation { magnifyValue = 1 }
            }
    }
    
    
    // MARK: - body
    var body: some View {
        Image("3")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .scaleEffect(magnifyBy)
            .gesture(newMagnification)
//            .scaleEffect(magnifyValue)
//            .gesture(oldMagnification)
    }
    
}

// MARK: - Preview
#Preview {
    PinchGesture()
}
