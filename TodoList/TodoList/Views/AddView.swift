//
//  AddView.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

/// A structure that computes input task screen.
///
/// - Parameters:
///   - text: Task content.
struct AddView: View {
    
    // MARK: PROPERTIES
    @State var text: String = ""
    @State var textFocused: Bool = false
    @FocusState var fieldInFocus: FieldOptions?
    
    /// A enum to provide options key. The main goal is avoid magic constants in the code.
    ///
    enum FieldOptions: Hashable {
        case text
    }
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        ScrollView {
            VStack (spacing: 12.0) {
                TextField("Type a new item here...", text: $text)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .focused($fieldInFocus, equals: .text)
                
                Button {
                    if text.count < 3 {
                        fieldInFocus = .text
                    }
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 55.0, alignment: .center)
                        .foregroundStyle(.white)
                        .background(Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
            }
            .padding()
        }
        .navigationTitle("Add new item ✍🏽")
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        AddView()
    }
}
