//
//  CartView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 10.12.23.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Properties
    @Environment(ProductViewModel.self) private var viewModel
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(viewModel.cartProducts) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            VStack {
                                Text(item.name)
                                Text(String(item.price))
                            }
                            
                            
                            Spacer()
                            
                            Text("sum: $\(String(format: "%.2f", Double(item.cartQuantity) * item.price))")
                        }
                    }
                    //TODO: - ???
                    //                .onDelete(perform: deleteItems)
                }
                
                HStack {
                    Spacer()
                    Text("Total: $\(String(format: "%.2f", viewModel.total))")
                        .font(.title)
                }
            } // List
            .navigationTitle("Busket")
            .toolbar {
                //TODO: - add delete func
                EditButton()
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        @State var viewModel = ProductViewModel()
        CartView()
            .environment(viewModel)
    }
    
}
