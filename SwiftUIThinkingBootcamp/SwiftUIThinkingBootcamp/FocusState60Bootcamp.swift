//
//  FocusState60Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 09/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing FocusState.
/// Here, we have created a professional login view
struct FocusState60Bootcamp: View {
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        // FocusOneFieldView()
        
        FocusLoginView()
    }
}

/// Struct to show and training Focus multiple fields
///
struct FocusLoginView: View {
    
    /// A enum to provide options key. The main goal is avoid magic constants in the code.
    ///
    enum FieldOptions: Hashable {
        case username, password
    }
    
    // MARK: PROPERTIES
    // username
    // @FocusState private var usernameInFocus: Bool
    @State private var username: String = ""
    
    // @FocusState private var passwordInFocus: Bool
    @State private var password: String = ""
    
    // Focus state from enum fields
    @FocusState private var fieldInFocus: FieldOptions?
    
    var body: some View {
        Spacer()
        
        HStack {
            VStack (alignment: .leading, spacing: 12) {
                Text("Hey,")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                
                Text("Welcome back!")
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
            
        VStack (spacing: 32) {
            TextField("Enter username...", text: $username)
                .padding(.horizontal)
                .overlay(
                    Rectangle()
                        .fill(fieldInFocus == .username ? .blue : .gray)
                        .frame(height: 1)
                        .offset(y: 24)
                )
                .frame(height: 50)
                .background(.thinMaterial)
                .textInputAutocapitalization(.never)
                .focused($fieldInFocus, equals: .username)
                //.focused($usernameInFocus)
            
            SecureField("Enter password...", text: $password)
                .padding(.horizontal)
                .overlay(
                    Rectangle()
                        .fill(fieldInFocus == .password ? .blue : .gray)
                        .frame(height: 1)
                        .offset(y: 24)
                )
                .frame(height: 50)
                .background(.thinMaterial)
                .textInputAutocapitalization(.never)
                .focused($fieldInFocus, equals: .password)
                //.focused($passwordInFocus)
            
            Button("Sing up 🚀".uppercased()) {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("Login success")
                } else if usernameIsValid {
                    fieldInFocus = .password
                } else {
                    fieldInFocus = .username
                }
            }
        }
        .padding(24)
        .frame(height: 250)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
        
        Spacer()
    }
}


/// Struct to show and training Focus programaticall
struct FocusOneFieldView: View {
    
    // MARK: PROPERTIES
    @FocusState private var nameInFocus: Bool
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name)
                .focused($nameInFocus)
            
            Button(nameInFocus ? "Remove focus" : "Focus on text field") {
                nameInFocus.toggle()
            }
        }
        .frame(height: 250)
        .frame(maxWidth: .infinity)
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.nameInFocus = true
            })
        }
    }
}

#Preview {
    FocusState60Bootcamp()
}
