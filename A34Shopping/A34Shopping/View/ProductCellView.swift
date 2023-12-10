//
//  ProductCellView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

struct ProductCellView: View {
    
    // MARK: - Properties
    @State var image: String
    @State var title: String
    @State var price: Double
    @State var cartQuantity: Int
    @State var stock: Int
    
    
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
                    
                    Image(image)
                        .resizable()
                        .frame(width: 120, height: 110)
                    
                    HStack(alignment: .bottom) {
                        
                        VStack(spacing: 30) {
                            Text(title)
                                .lineLimit(2)
                                .font(.title2)
                                .fontWeight(.medium)
                            
                            Text(String(format: "%.2f$", price))
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 50, height: 40)
                                .padding(.trailing)
                                .foregroundStyle(cartQuantity == 0 ? .gray : .blue)
                                .overlay {
                                    Text("\(cartQuantity)")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                        .padding(.trailing)
                                }
                            
                            HStack {
                                
                                Circle()
                                    .foregroundStyle(cartQuantity == 0 ? .gray : .blue)
                                    .frame(width: 36)
                                    .overlay { Image(systemName: "minus") }
                                    .onTapGesture { cartQuantity -= 1 }
                                    .disabled(cartQuantity == 0 ? true : false)
                                
                                Circle()
                                    .foregroundStyle(cartQuantity == stock ? .gray : .blue)
                                    .frame(width: 36)
                                    .padding(.horizontal)
                                    .overlay { Image(systemName: "plus") }
                                    .onTapGesture { cartQuantity += 1 }
                                    .disabled(cartQuantity == stock ? true : false)
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
    } // body
    
}


// MARK: - Preview
#Preview {
    ProductCellView(image: "banana", title: "Banana", price: 1.35, cartQuantity: 0, stock: 5)
}
