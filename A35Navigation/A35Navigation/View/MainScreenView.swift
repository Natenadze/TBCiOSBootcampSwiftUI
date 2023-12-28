//
//  MainScreenView.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI


struct MainScreenView: View {
    
    @StateObject private var viewModel = MainScreenViewModel()
    @State var path = NavigationPath()
    @State private var alertIsShowing: Bool = false
    @State var alertMessage = ""
    
    
    // MARK: - Mark
    var body: some View {
        NavigationStack(path: $path) {
            destinationList
            menu
        }
    }
    
}

// MARK: - extension
extension MainScreenView {
    var destinationList: some View {
        List {
            ForEach(viewModel.destinations, id: \.cityName) { dest in
                NavigationLink(dest.cityName, value: dest)
            }
        }
        .navigationTitle("Destinations")
        .alert(alertMessage, isPresented: $alertIsShowing) {}
        .navigationDestination(for: City.self) { city in
            DestinationDetailScreen(destination: city, path: $path)
        }
    }
    var menu: some View {
        Menu {
            Button("Tip 1") {
                alertMessage = "Tip 1"
                alertIsShowing.toggle()
            }
            Button("Tip 2") {
                alertMessage = "Tip 2"
                alertIsShowing.toggle()
            }
            Button("Tip 3") {
                alertMessage = "Tip 3"
                alertIsShowing.toggle()
            }
        } label: {
            Text("Travel tips")
                .frame(width: 150, height: 40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}


// MARK: - Preview
#Preview {
    MainScreenView()
}
