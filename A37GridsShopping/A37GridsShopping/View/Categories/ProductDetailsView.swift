//
//  ProductDetailsView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 28.12.23.
//

import SwiftUI

import SwiftUI

struct ProductDetailView: View {
    
    let product: SingleProduct
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                .clipped()

                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Text(product.description)
                    .font(.body)
                    .padding(.horizontal)

                Text("Price: $\(product.price)")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.horizontal)

                Text("Brand: \(product.brand)")
                    .font(.headline)
                    .padding(.horizontal)

                Spacer()
                
                Button("Go to category list") {
                    path = NavigationPath()
                }
            }
            .padding()
        }
        .navigationBarTitle(Text("Product Details"), displayMode: .inline)
    }
}

