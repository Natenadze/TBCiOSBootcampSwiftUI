//
//  ProfileImageView.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct ProfileImageView: View {
    
    @State private var offset = CGSize.zero
    let imageName: Int
    var removal: ( () -> Void)? = nil
    
    var body: some View {
        Image("\(imageName)")
            .resizable()
            
            .frame(width: 320, height: 500)
            .scaledToFill()
            .rotationEffect(.degrees(Double(offset.width / 5)))
            .offset(x: offset.width * 3, y: 0)
            .opacity(2 - Double(abs(offset.width / 55)))
            .shadow(radius: 10)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(offset.width) > 100 {
                            removal?()
                        } else {
                            offset = .zero
                        }
                    }
            )
            .animation(.spring(), value: offset)
    }
    
}

#Preview {
    ProfileImageView(imageName: 3)
}
