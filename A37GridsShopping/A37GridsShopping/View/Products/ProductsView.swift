//
//  ProductsView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 19.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: ProductViewModel
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    
    // MARK: - body
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Item Count: \(viewModel.totalQuantity)x")
                        Text("total price: $\(viewModel.totalPrice)")
                        Text("balance: $\(viewModel.balance)")
                    }.font(.headline)
                    
                    Spacer()
                    
                    Button("checkout") {
                        viewModel.checkout()
                    }
                }
                .padding(6)
                .background(.orange)
             
                
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.allProducts) { item in
                            ProductGridView(item: item)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            if viewModel.showProgress {
                ProgressView()
                    .tint(.gray)
                    .scaleEffect(4)
            }
           
        }
        .padding(.top)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Insufficient Balance"), 
                  message: Text("Please add funds to your account."),
                  dismissButton: .default(Text("OK")))
        }
        
      
    }
}


#Preview {
    ProductsView()
}
