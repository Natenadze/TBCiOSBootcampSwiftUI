//
//  MainScreenView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI

/*

 Travel Tips
 MainScreen-ზე დაამატეთ ღილაკი Travel Tips-ის, რომელზეც დაჭერისას რანდომად რაღაც სამოგზაუროდ საჭირო Tips შემოგვთავაზებს და ალერტით ვაჩვენებთ.
 
 ასევე კიდევ ერთი Optional შეგიძლიათ გვერდიდან გვერდზე გადასვლა გააკეთოთ სხვადასხვა ანიმაციებით.
 */

struct MainScreenView: View {
    
    @StateObject private var viewModel = MainScreenViewModel()
    @State var path = NavigationPath()
    
    
    // MARK: - Mark
    var body: some View {
        NavigationStack(path: $path) {
        
                List {
                    ForEach(viewModel.destinations) { dest in
                        NavigationLink(dest.id, value: dest)
                        
                    }
                }
                .navigationDestination(for: Destination.self) { destin in
                    DestinationDetailScreen(destination: destin, path: $path)
                }
                .navigationTitle("Destinations")
                
                
            Menu {
                Text("tip number 1")
                Text("tip number 2")
                Text("tip number 3")
            } label: {
                Text("Travel tips")
                    .frame(width: 150, height: 40)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
    
}


// MARK: - Preview
#Preview {
    MainScreenView()
}
