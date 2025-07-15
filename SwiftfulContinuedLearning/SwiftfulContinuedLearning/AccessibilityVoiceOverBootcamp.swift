//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/07/25.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    // MARK: PROPERTIES
    @State private var isActive = false
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "OFF")
                            
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("Preferences")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }

                } header: {
                    Text("Applications")
                }
            }
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
