//
//  ProductGridView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 25.12.23.
//

import SwiftUI

struct ProductGridView: View {
    
    // MARK: - properties
    @EnvironmentObject private var viewModel: ProductViewModel
    let item: SingleProduct
   
    
    // MARK: - init
    init(item: SingleProduct) {
        self.item = item
    }
    
    // MARK: - body
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.thumbnail), content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }) {
                ProgressView()
            }
            .frame(width: 150, height: 200)
                
            
            Text(item.title)
            RatingBarView(selected: item.rating)
            HStack(spacing: 20) {
                Text("€ \(item.price)")
                    .font(.headline)
                
                
                Circle()
                    .foregroundStyle(item.cartQuantity == 0 ? .gray : .blue)
                    .frame(width: 30)
                    .overlay { Image(systemName: "minus").foregroundStyle(.white) }
                    .onTapGesture {
                        viewModel.decreaseProductQuantityAndUpdateCart(item)
                    }
                    .disabled(item.cartQuantity == 0 ? true : false)
                
                Text(String(item.cartQuantity))
                
                Circle()
                    .foregroundStyle(item.cartQuantity == item.stock ? .gray : .blue)
                    .frame(width: 30)
                    .overlay { Image(systemName: "plus").foregroundStyle(.white) }
                    .onTapGesture {
                        viewModel.increaseProductQuantityAndUpdateCart(item)
                    }
                    .disabled(item.cartQuantity == item.stock ? true : false)
            }
            
        }
    }
}

#Preview {
    ProductGridView(item: SingleProduct(id: 1, title: "Samsung Universe 9",
                                        description: "Samsung's new variant which goes beyond Galaxy to the Universe", price: 1234, discountPercentage: 1.0, rating: 4.5, stock: 43, brand: "Samsung", category: "smartphones", thumbnail: "", images: [""]))
}



