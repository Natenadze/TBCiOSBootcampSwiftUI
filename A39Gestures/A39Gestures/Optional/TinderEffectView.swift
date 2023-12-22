//
//  TinderEffectView.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct TinderEffectView: View {
    
    // MARK: - Properties
    @State var images = [11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    // MARK: - body
    var body: some View {
        VStack {
            Text("Swipe left or right")
                .padding()
                .font(.headline)
            Spacer()
            ZStack {
                ForEach(0..<images.count, id: \.self) { num in
                    ProfileImageView(imageName: images[num]) {
                        withAnimation{ removeImage(at: num) }
                    }
                    .stacked(at: num, in: images.count)
                }
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Methods
    func removeImage(at index: Int) {
        images.remove(at: index)
    }
}


#Preview {
    TinderEffectView()
}
