//
//  HotelsView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct HotelsView: View {
    
    @Binding var path: NavigationPath
    let hotels: [CityComponent]

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                ForEach(hotels, id: \.name) { hotel in
                    Text(hotel.name)
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
        HotelsView(path: $path, hotels: [CityComponent(image: "", name: "", description: "")])
    }
}
