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
    // List view
    @EnvironmentObject var listViewModel: ListViewModel
    // iOS 15.0+
    @Environment(\.dismiss) private var dismiss
    // Alert
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    
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
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .focused($fieldInFocus, equals: .text)
                
                Button (action: buttonSavePressed) {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 55.0, alignment: .center)
                        .foregroundStyle(.white)
                        .background(Color(.accent))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
            }
            .padding()
        }
        .navigationTitle("Add new item ✍🏽")
        .alert(isPresented: $showAlert, content: getAlert)
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}

// MARK: FUNCTIONS
extension AddView {
    
    /// Call add  method to create a new task when text is valid.
    ///
    ///```
    ///buttonSavePressed()
    ///```
    ///
    /// - Complexity: O(1) constant.
    ///
    private func buttonSavePressed() {
        if isValidText() {
            listViewModel.createTask(title: text)
            dismiss()
        } else {
            alertTitle = "Please, enter a task with more than 3 characters. 👀😮🙃"
            showAlert.toggle()
            fieldInFocus = .text
        }
    }
    
    /// Check if text is valid.
    ///
    /// When text is valid, returns true. Otherwise false.
    ///
    ///```
    ///isValidText()
    ///```
    ///
    /// - Complexity: O(n), where n is the length of the string.
    ///
    private func isValidText() -> Bool {
        return text.count > 3
    }
    
    /// Gets an alert with specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title, but will NOT have a message.
    ///
    ///```
    ///getAlert() -> Alert(title: Text(alertTitle))
    ///```
    /// - Warning: There is no additional message in this alert.
    /// - Returns: Returns an alert with a title.
    /// - Complexity: O(1) constant.
    ///
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
