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
    @State var currentUsername: String? = nil
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add username")
            
            if let username = currentUsername {
                Text(username)
            }
            
            Button("Save") {
                currentUsername = "LRS"
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    AppStorage52Bootcamp()
}
