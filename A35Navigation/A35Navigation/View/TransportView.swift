//
//  TransportView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct TransportView: View {
    
    @Binding var path: NavigationPath
    let transport: [CityComponent]

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                ForEach(transport, id: \.name) { transport in
                    Text(transport.name)
                        .font(.title)
                }
            }
            
            Button("Go to Home Page") {
                path = NavigationPath()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        @State var path = NavigationPath()
        TransportView(path: $path, transport: [CityComponent(image: "", name: "", description: "")])
    }
}
