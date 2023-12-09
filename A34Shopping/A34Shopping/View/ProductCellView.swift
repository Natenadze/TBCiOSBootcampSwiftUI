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
    @State var price: Float
    @State var quantity: Int
    
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            HStack(spacing: 20) {
                Image("banana")
                    .resizable()
                    .frame(width: 130, height: 120)
                    
                    
                
            
                HStack(alignment: .bottom) {
                    VStack(spacing: 30) {
                        Text(title)
                            .font(.title)
                        
                        
                        Text(String(format: "%.2f$", price))
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                      
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 40)
                            .padding(.trailing)
                            .foregroundStyle(.gray)
                            .overlay {
                                Text("\(quantity)")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                            }
                        
                        HStack {
                            Circle()
                                .foregroundStyle(.blue)
                                .frame(width: 40)
                                .overlay {
                                    Image(systemName: "minus")
                                        .foregroundStyle(.white)
                                        .font(.title)
                                }
                                .onTapGesture {
                                    quantity -= 1
                                }
                            
                            Circle()
                                .foregroundStyle(.blue)
                                .frame(width: 40)
                                .padding(.horizontal)
                                .overlay {
                                    Image(systemName: "plus")
                                        .foregroundStyle(.white)
                                        .font(.title)
                                }
                                .onTapGesture {
                                    quantity += 1
                                }
                        }
                        
                      
                    }
                    
                   
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
    }
}

// MARK: - Preview
#Preview {
    ProductCellView(image: "banana", title: "Banana", price: 1.35, quantity: 0)
}
