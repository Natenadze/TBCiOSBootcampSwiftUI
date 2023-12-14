//
//  DestinationDetailScreen.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    // MARK: - Properties
    var destination: Destination
    @Binding var path: NavigationPath
    
    
    // MARK: - body
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: destination.hotels))
                .frame(width: 200, height: 200)
            
            Text(destination.museums)
            
            VStack(spacing: 20) {
                Section {
                    NavigationLink("Transport") {
                        TransportView(path: $path)
                    }
                    
                    NavigationLink("Must See") {
                        MustSeeView(path: $path)
                    }

                    NavigationLink("Hotels") {
                        HotelsView(path: $path)
                    }
                }
                .frame(width: 200, height: 36)
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
            }
            .font(.title)
            .foregroundStyle(.white)
            

            
        }
       
    }
    
}

