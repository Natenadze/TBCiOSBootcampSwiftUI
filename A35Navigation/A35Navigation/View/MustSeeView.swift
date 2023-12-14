//
//  MustSeeView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct MustSeeView: View {
    
    @Binding var path: NavigationPath
    let mustSee: [CityComponent]

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                ForEach(mustSee, id: \.name) { place in
                    Text(place.name)
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
        MustSeeView(path: $path, mustSee: [CityComponent(image: "asd", name: "asds", description: "")])
    }
}
