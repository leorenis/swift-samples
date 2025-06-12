//
//  BackgroundThreadBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 12/06/25.
//

import SwiftUI
// MARK: VIEWMODEL
class BackgroundThreadViewModel: ObservableObject {
    
}

// MARK: STRUCTS
struct BackgroundThreadBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = BackgroundThreadViewModel()
    
    // MARK: BODY
    var body: some View {
        Text("Hello, BG Threads!")
    }
}

// MARK: PREVIEW
#Preview {
    BackgroundThreadBootcamp()
}
