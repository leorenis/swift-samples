//
//  AppStorage52Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://www.youtube.com/watch?v=zyuSUrfelw8&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=53
//
//  Created by Leo on 05/04/25.
//

import SwiftUI

/// A class to provide data access for our Environment.
/// 
struct AppStorage52Bootcamp: View {
    
    // MARK: PROPERTIES
    // @State var currentUsername: String? = nil
    @AppStorage(OptionsKey.username.key) var currentUsername: String?
    
    /// A enum to provide options key. The main goal is avoid magic constants in the code.
    ///
    enum OptionsKey {
        case username
        
        var key: String {
            switch self {
            case .username: return "username"
            }
        }
    }
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add username")
            
            if let username = currentUsername {
                Text(username)
            }
            
            Button("Save") {
                let name: String = "John Doe"
                currentUsername = name
                /// Important: Use this only to save small pieces of data. To large data, prefer a external database.
                /// Tip: When we use @AppStorage, the state became able to update data directly by assing value to a variable.
                ///   - We don't need use class UserDefaults anymore.
                // UserDefaults.standard.set(name, forKey: OptionsKey.username.key)
            }
        }
        /*.onAppear {
            currentUsername = UserDefaults.standard.string(forKey: OptionsKey.username.key)
        }*/
    }
}

// MARK: PREVIEW
#Preview {
    AppStorage52Bootcamp()
}
