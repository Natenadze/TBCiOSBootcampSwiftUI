//
//  PersonDetailView.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI
import PhotosUI


struct PersonDetailView: View {
    
    @StateObject private var viewModel = PersonDetailViewModel()
    @Binding var person: Person!
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    private var personImage: Image {
        viewModel.selectedImage ?? person.image
    }
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            mainImage
            settingsList
            saveChangesButton
        }
    }
    
    // MARK: - Helper Method
    
    private func settingsBlock(for name: String, placeholder: String, keyPath: WritableKeyPath<Person, String>) -> some View {
        SettingsBlock(name: name, placeholder: placeholder, textFieldBinding: Binding(
            get: { person[keyPath: keyPath] },
            set: { newValue in
                person[keyPath: keyPath] = newValue
            }
        ))
    }

}


// MARK: - Extracted Views

extension PersonDetailView {
    
    private var mainImage: some View {
        personImage
            .resizable()
            .scaledToFill()
            .frame(width: 170, height: 170)
            .clipShape(.circle)
            .onChange(of: viewModel.selectedImage) { _, newValue in
                person.image = newValue!
            }
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelection) {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black).opacity(0.6)
                        .padding()
                }
            }
    }
    
    private var settingsList: some View {
        VStack(alignment: .leading) {
            settingsBlock(for: "Name", placeholder: "name", keyPath: \.name)
            settingsBlock(for: "Email", placeholder: "test@gmail.com", keyPath: \.email)
            settingsBlock(for: "Password", placeholder: "********", keyPath: \.password)
            settingsBlock(for: "Date and Birth", placeholder: "01/12/1992", keyPath: \.dateOfBirth)
            settingsBlock(for: "Country/Region", placeholder: "country", keyPath: \.country)
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
    }
    
    private var saveChangesButton: some View {
        Button("Save Changes") {
            //TODO: - save changes
            print("changes saved")
            dismiss()
        }
        .frame(width: 220, height: 44)
        .background(.customButton)
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .fontWeight(.bold)
        .foregroundStyle(.white)
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
//#Preview {
//    PersonDetailView()
//}
