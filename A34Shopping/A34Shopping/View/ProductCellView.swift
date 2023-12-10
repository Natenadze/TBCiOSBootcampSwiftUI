//
//  ProductCellView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

struct ProductCellView: View {
    
    // MARK: - Properties
    @Environment(ProductViewModel.self) private var viewModel
    private var product: Product
    
    // MARK: - init
    init(product: Product) {
        self.product = product
    }
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Color.white
            
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 1)
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
                
                HStack(spacing: 20) {
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 120, height: 110)
                    
                    HStack(alignment: .bottom) {
                        
                        VStack(spacing: 30) {
                            Text(product.name)
                                .lineLimit(2)
                                .font(.title2)
                                .fontWeight(.medium)
                            
                            Text(String(product.price))
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 46, height: 36)
                                .padding(.trailing)
                                .foregroundStyle(product.cartQuantity == 0 ? .gray : .blue)
                                .overlay {
                                    Text("\(product.cartQuantity)")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                        .padding(.trailing)
                                }
                            
                            HStack {
                                
                                Circle()
                                    .foregroundStyle(product.cartQuantity == 0 ? .gray : .blue)
                                    .frame(width: 36)
                                    .overlay { Image(systemName: "minus") }
                                    .onTapGesture {
                                        viewModel.decreaseProductQuantityAndUpdateCart(product)
                                        //                                        product.cartQuantity -= 1
                                    }
                                    .disabled(product.cartQuantity == 0 ? true : false)
                                
                                Circle()
                                    .foregroundStyle(product.cartQuantity == product.stock ? .gray : .blue)
                                    .frame(width: 36)
                                    .padding(.horizontal)
                                    .overlay { Image(systemName: "plus") }
                                    .onTapGesture {
                                        viewModel.increaseProductQuantityAndUpdateCart(product)
                                        //                                        product.addProduct()
                                    }
                                    .disabled(product.cartQuantity == product.stock ? true : false)
                            }
                            .foregroundStyle(.white)
                            .font(.title)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        } // ZStack
        //            .navigationTitle("Products")
        
    } // body
    
}


// MARK: - Preview
//#Preview {
//    ProductCellView(image: "banana", title: "Banana", price: 1.35, cartQuantity: 0, stock: 5)
//}
