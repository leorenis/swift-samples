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
     * OBS: Video stopped 13min30
     * To fold block: Command + Ctrol + Left Arrow
     * 1. Fix title
     * 2. Fix alert
     * ...
     */
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Text("Hello")
                ForEach(data, id: \.self) { name in
                    Text(name)
                }
            }.navigationTitle(Text("Docs bootcamp"))
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
    }
    
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}
// MARK: Preview
#Preview {
    DocumentationBootcamp()
}
