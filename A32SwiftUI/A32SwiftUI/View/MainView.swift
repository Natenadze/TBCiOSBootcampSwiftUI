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
            
            clearChatButton
        }
    }
     
}

// MARK: - Extracted Views
extension MainView {
    
    private var clearChatButton: some View {
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



// MARK: - ChatView
struct ChatView: View {
    
    @Binding var showDetailScreen: Bool
    @State private var selectedPerson: Person? = nil
    
    // MARK: - Body
    var body: some View {
        
        List {
            ForEach(Person.initial) { person in
                PersonView(
                    image: person.image,
                    name: person.name,
                    message: person.message,
                    time: person.time
                )
                .onTapGesture {
                    selectedPerson = person
                    showDetailScreen.toggle()
                }
            }
            .preferredColorScheme(.dark)
        }
        .fullScreenCover(isPresented: $showDetailScreen) {
            PersonDetailView(person: $selectedPerson)
        }
        
    }
}


// MARK: - PersonView
struct PersonView: View {
    
    // MARK: - Properties
    let image: Image
    let name: String
    let message: String
    let time: String
    
    // MARK: - Body
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
