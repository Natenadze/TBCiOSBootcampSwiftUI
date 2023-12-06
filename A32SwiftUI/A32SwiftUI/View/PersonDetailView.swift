//
//  PersonDetailView.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI

struct PersonDetailView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var dateAndBirth = ""
    @State private var country = ""
     
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Image("jail")
                .resizable()
                .scaledToFill()
                .frame(width: 170, height: 170)
                .clipShape(.circle)
                .overlay(alignment: .bottomTrailing) {
                    Button(action: {
                        //TODO: - change photo
                        print("photo changed")
                    }, label: {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.black).opacity(0.6)
                            .padding()
                    })
                    
                }
            VStack(alignment: .leading) {
                SettingsBlock(name: "Name", placeholder: "name", textFieldBinding: $name)
                SettingsBlock(name: "Email", placeholder: "test@gmail.com", textFieldBinding: $email)
                SettingsBlock(name: "Password", placeholder: "********", textFieldBinding: $password)
                SettingsBlock(name: "Date and Birth", placeholder: "01/12/1992", textFieldBinding: $dateAndBirth)
                SettingsBlock(name: "Country/Region", placeholder: "country", textFieldBinding: $country)
            }
            .padding(.horizontal)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                }
            }
            
            Button("Save Changes") {
                //TODO: - save changes
                print("changes saved")
            }
            .frame(width: 220, height: 44)
            .background(.customButton)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .fontWeight(.bold)
            .foregroundStyle(.white)
        }
    }
    
}


// MARK: - Helper View SettingsBlock
struct SettingsBlock: View {
    
    // MARK: - Properties
    var name: String
    var placeholder: String
    @Binding var textFieldBinding: String
    
    // MARK: - Body
    var body: some View {
        Text(name)
        
        Group {
            if name == "Password" {
                SecureField(placeholder, text: $textFieldBinding)
            } else {
                TextField(placeholder, text: $textFieldBinding)
            }
        }
        .padding(7)
        .frame(height: 44)
        .autocorrectionDisabled()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}


// MARK: - Preview
#Preview {
    PersonDetailView()
}
