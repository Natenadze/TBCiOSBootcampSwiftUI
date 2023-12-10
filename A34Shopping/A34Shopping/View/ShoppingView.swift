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
 Optional (მარაგი რომ ამოიწურება, აღარ იყოს შესაძლებელი პროდუქტის კალათაში დამატება).
 ასევე პროდუქტებს ჰქონდეთ image.
 
 
 მთლიანად პროდუქტის წაშლა.
 Optional (დაამატეთ ფასდაკლების ღილაკი. მაგალითად 20%იანი ფასდაკლების, და მასზე დაკლიკებისას ყველა პროდუქტს დააკლდეს პროცენტის შესაბამისად თანხა).
 კალათის ვიუ, სადაც გამოტანილი იქნება პროდუქტის რაოდენობა და ჯამური ღირებულება,

 */

struct ShoppingView: View {
    
    private var viewModel = ProductViewModel()
    
    // MARK: - Body
    var body: some View {
        
        
        
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.products) { product in
                    
                    ProductCellView(
                        image: product.image,
                        title: product.name,
                        price: product.price,
                        cartQuantity: product.cartQuantity,
                        stock: product.stock
                    )
                    
                }
            }
        } // ScrollView
        .padding(.horizontal, 8)
    } // body
    
}

// MARK: - Preview
#Preview {
    ShoppingView()
}
