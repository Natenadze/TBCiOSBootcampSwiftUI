//
//  ShoppingView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

/*
 შექმენით აპპი სადაც იმიტაცია იქნება Grocery Shop-ის.
 აპლიკაციის ლოგიკა გატანილი იქნება viewModel-ში.
 
 პროდუქტის რაოდენობის მომატება/მოკლება.
 მთლიანად პროდუქტის წაშლა.
 Optional (დაამატეთ ფასდაკლების ღილაკი. მაგალითად 20%იანი ფასდაკლების, და მასზე დაკლიკებისას ყველა პროდუქტს დააკლდეს პროცენტის შესაბამისად თანხა).
 კალათის ვიუ, სადაც გამოტანილი იქნება პროდუქტის რაოდენობა და ჯამური ღირებულება,
 ასევე პროდუქტებს ჰქონდეთ image.
 Optional (მარაგი რომ ამოიწურება, აღარ იყოს შესაძლებელი პროდუქტის კალათაში დამატება).
 */

struct ShoppingView: View {
    
    private var viewModel = ProductViewModel()
    
    // MARK: - Body
    var body: some View {
     
        VStack(spacing: 40) {
            ForEach(viewModel.products) { product in
                HStack(spacing: 30) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFill()
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text(product.name)
                            Text("Stock: \(product.stock)")
                        }
                        
                        Text("\(product.cartQuantity)")
                        
                        HStack {
                            Button("-") {
                                viewModel.decreaseCartQuantity(product)
                            }
                            
                            Button("+") {
                                viewModel.increaseCartQuantity(product)
                            } 
                            
                            
                            Button(action: {
                                viewModel.handleIsFavoriteTapped(product)
                            }, label: {
                                Image(systemName: "heart.fill")
                            })
                            .foregroundStyle(product.isFavorite ? .green : .black)
                           
                        }
                        .font(.title)
                        
                    }
                   
                }
                .frame(maxWidth: .infinity)
                .background(.gray)
                
               
                
            }
        }
        .font(.headline)
        .foregroundStyle(.white)
     
        
    }
}

#Preview {
    ShoppingView()
}
