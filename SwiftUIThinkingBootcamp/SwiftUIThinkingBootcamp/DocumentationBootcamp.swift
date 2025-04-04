//
//  DocumentationBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 03/04/25.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: PROPERTIES
    @State var data: [String] = ["Apples", "Bananas", "Oranges"]
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    // Leo: Working copy - Things to do:
    /**
     * To fold block: Command + Ctrol + Left Arrow
     * 1. Fix title
     * 2. Fix alert
     * ...
     */
    
    var body: some View {
        NavigationStack { // START: NAV
            ZStack {
                // Background
                Color("AdaptiveColor")
                    .ignoresSafeArea(.all)
                
                // Foreground
                foregroundLayer
                .navigationTitle(Text("Docs bootcamp"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Alert", action: {
                            showAlert.toggle()
                        })
                   }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is the alert")
                }
            }
        } // END: NAV
    }
    
    /// This is the foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
            }
        } // END: SCROLLV
    }
    
    // MARK: FUNCTIONS
    
    /// Gets an alert with a specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter, but will NOT have a message.
    /// ```
    /// getAlert(text: "This is the alert") -> Alert(title: Text("This is the alert"))
    /// ```
    ///
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returs an alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}
// MARK: Preview
#Preview {
    DocumentationBootcamp()
}
