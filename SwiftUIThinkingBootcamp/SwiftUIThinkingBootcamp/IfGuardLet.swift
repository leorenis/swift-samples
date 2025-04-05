//
//  IfGuardLet.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 04/04/25.
//

import SwiftUI

struct IfGuardLet: View {
    
    // MARK: PROPERTIES
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    @State var currentUserID: String? = "be3d-fc42-..."
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Here we are practicing safe coding")
                
                if let safeText = displayText {
                    Text(safeText)
                        .font(.title)
                }
                
                /**
                 * BAD CODE. DO NOT USE EVER. this statement !. This could crash your APP.
                 * DO NOT FORCE UNWRAP VALUES
                 * Safe coding = great coding 🎉
                 */
                // Text(displayText!)
                
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("IfGuardLet")
            .onAppear {
                loadData2()
            }
        }
    }
    
    // MARK: FUNCTIONS
    /// Function loadData is responsible for call external services and load data from this boundaries. After 2 seconds, the new text will be on the screen.
    ///
    /// ```
    /// loadData() -> Void
    /// ```
    /// - Warning: This is only samples to training my swift skills in if let.
    ///
    private func loadData() {
        if let safeUserID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                displayText = "This is the new data. User ID: \(safeUserID)"
                isLoading = false
            }
        } else {
            displayText = "No user ID found"
        }
        
    }
    
    // MARK: FUNCTIONS
    /// Function loadData2 is responsible for call for e.g  external services and load data from this boundaries. After 2 seconds, the new text will be on the screen.
    ///
    /// ```
    /// loadData() -> Void
    /// ```
    ///
    /// - Warning: This is only samples to training my swift skills in guard let.
    ///
    private func loadData2() {
        guard let safeUserID = currentUserID else {
            displayText = "No user ID found"
            // Early return: A litle bit calisthenics way.
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            displayText = "This is the new data. User ID: \(safeUserID)"
            isLoading = false
        }
    }
}

// MARK: PREVIEW
#Preview {
    IfGuardLet()
}
