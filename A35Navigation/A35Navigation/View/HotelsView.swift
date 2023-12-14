//
//  HotelsView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct HotelsView: View {
    
    @Binding var path: NavigationPath

    
    var body: some View {
        Button("Go to Home Page") {
           path = NavigationPath()
        }

    }
}

#Preview {
    NavigationStack {
        @State var path = NavigationPath()
        HotelsView(path: $path)
    }
}
