//
//  ContentView.swift
//  A40Animations
//
//  Created by Davit Natenadze on 23.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        Text("TBC IT Academy")
            .font(isAnimating ? .title : .headline)
            .offset(y: isAnimating ? -30 : 0)
            .foregroundStyle(isAnimating ? .red : .blue)
            .animation( .easeInOut(duration: 2).repeatForever(),
                        value: isAnimating)
            .onAppear { isAnimating.toggle() }
    }
}



#Preview {
    ContentView()
}
