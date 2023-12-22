//
//  ContentView.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            TapGestureView()
                .tabItem { Label("Tap", systemImage: "photo") }
            
            LongPressGestureView()
                .tabItem { Label("LongPress", systemImage: "photo") }
            
            PinchGesture()
                .tabItem { Label("Pinch", systemImage: "photo") }
            
            DragGestureView()
                .tabItem { Label("drag", systemImage: "photo") }
            
            TinderEffectView()
                .tabItem { Label("Optional", systemImage: "photo") }
        }
    }
}



#Preview {
    ContentView()
}
