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
    @EnvironmentObject var listViewModel: ListViewModel
    // iOS 15.0+
    @Environment(\.dismiss) private var dismiss
    
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
                
                Button (action: buttonSavePressed) {
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
    
    /// Check validations and call add call  method to create a new task.
    ///
    ///```
    ///buttonSavePressed()
    ///```
    ///
    /// - Complexity: O(1) constant.
    ///
    private func buttonSavePressed() {
        if text.count < 3 {
            fieldInFocus = .text
            return;
        }
        listViewModel.createTask(title: text)
        dismiss()
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
