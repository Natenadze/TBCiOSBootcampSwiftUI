//
//  LongPressGesture.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct LongPressGestureView: View {
    
    @State private var degrees = 0.0
    
    var body: some View {
        Image("2")
            .resizable()
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(degrees))
            .onLongPressGesture(minimumDuration: 1) {
                withAnimation(.linear(duration: 3)) {
                    degrees += 360
                }
            }
    }
}

#Preview {
    LongPressGestureView()
}
