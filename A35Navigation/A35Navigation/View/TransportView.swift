//
//  TransportView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct TransportView: View {
    
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
        TransportView(path: $path)
    }
}
