//
//  Tap.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct TapGestureView: View {
    
    // MARK: - Properties
    @State private var scale: CGFloat = 1.0
    
    // MARK: - body
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Reset") {
                    withAnimation { scale = 1.0 }
                }
                .padding()
                .font(.title2)
            }
            
            Spacer()
            
            Text("Tap Gesture")
                .font(.title)
                .padding(.bottom, 50)
            
            
            Image("1")
                .resizable()
                .frame(width: 200 * scale, height: 200 * scale)
                .onTapGesture {
                    withAnimation { scale *= 1.15 }
                }
            
            Spacer()
        }
    }
}

#Preview {
    TapGestureView()
}
