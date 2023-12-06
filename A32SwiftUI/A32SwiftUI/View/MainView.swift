//
//  MainView.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI


struct MainView: View {
    
    // MARK: - Properties
    @State private var showDetailScreen = false
    @State private var clearChat = false
    
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            
            if !clearChat {
                ChatView(showDetailScreen: $showDetailScreen)
            }else {
                Spacer()
                Text("Chat is Clear").font(.title)
                Spacer()
            }

            Button("Clear Chat") { 
                clearChat = true
            }
            .frame(width: 220, height: 44)
            .background(.customButton)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            
            .navigationTitle("chat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset") { clearChat = false }
                }
            }
        }
        
      
        
    }
    
    
    
    
}


// MARK: - ChatView
struct ChatView: View {
    
    @Binding var showDetailScreen: Bool
    
    var body: some View {
        List(Person.initial) { person in
            PersonView(
                image: person.image,
                name: person.name,
                message: person.message,
                time: person.time
            )
        }
        .onTapGesture {
            showDetailScreen.toggle()
        }
        .fullScreenCover(isPresented: $showDetailScreen) {
            PersonDetailView()
        }
    }
}


// MARK: - PersonView
struct PersonView: View {
    
    let image: Image
    let name: String
    let message: String
    let time: String
    
    var body: some View {
        HStack {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name).font(.title2)
                    Spacer()
                    Text(time).foregroundStyle(.gray)
                }
                
                Text(message)
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
        }
    }
    
}


// MARK: - Preview
#Preview {
    MainView()
}
