//
//  DestinationDetailScreen.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    // MARK: - Properties
    var destination: City
    @Binding var path: NavigationPath
    
    // MARK: - body
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: destination.mainImage)) { loadedImage in
                loadedImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
            } placeholder: {
                ProgressView()
            }
            
            Text(destination.description)
            
            VStack(spacing: 20) {
                Section {
                    NavigationLink("Transport") {
                        TransportView(path: $path, transport: destination.transport)
                    }
                    
                    NavigationLink("Must See") {
                        MustSeeView(path: $path, mustSee: destination.mustSee)
                    }

                    NavigationLink("Hotels") {
                        HotelsView(path: $path, hotels: destination.hotels)
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

