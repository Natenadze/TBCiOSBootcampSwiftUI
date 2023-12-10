//
//  MainView.swift
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
 კალათის ვიუ, სადაც გამოტანილი იქნება პროდუქტის რაოდენობა და ჯამური ღირებულება,
 
 
 მთლიანად პროდუქტის წაშლა.
 Optional (დაამატეთ ფასდაკლების ღილაკი. მაგალითად 20%იანი ფასდაკლების, და მასზე დაკლიკებისას ყველა პროდუქტს დააკლდეს პროცენტის შესაბამისად თანხა).
 
 
 */

struct MainView: View {
    
    // MARK: - Properties
    @Environment(ProductViewModel.self) private var viewModel
    
    
    // MARK: - Body
    var body: some View {
        
        TabView {
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.allProducts) { product in
                        ProductCellView(product: product)
                    }
                }
            }
            .padding(.horizontal, 8)
            .tabItem {
                Label("Products", systemImage: "house")
            }
            
            
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            
        }
        
    } // body
    
}

// MARK: - Preview
#Preview {
    MainView()
}
