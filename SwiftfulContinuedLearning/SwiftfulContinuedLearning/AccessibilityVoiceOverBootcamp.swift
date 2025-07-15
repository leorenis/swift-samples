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
                
                
                VStack {
                    Text("Content")
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { index in
                                VStack {
                                    Image("dog")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 188, height: 230)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                    
                                    Text("Dog \(index)")
                                        .onTapGesture {
                                            
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
