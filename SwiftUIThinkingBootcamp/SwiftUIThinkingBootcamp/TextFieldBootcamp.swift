//
//  TextFieldBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 01/04/25.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var textField: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField("Enter your name...", text: $textField)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.6).cornerRadius(10))
                        .font(.headline)
                    
                    Button(action: saveText) {
                        Text("Add".uppercased())
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(isValidTextField() ? Color.blue : Color.gray)
                            .cornerRadius(10)
                            .font(.headline)
                        
                    }
                    .disabled(!isValidTextField())
                    
                    ForEach(dataArray, id: \.self) { data in
                        Text(data)
                    }
                }
                .padding()
                
            }
            .navigationTitle("Textfield Bootcamp")
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).ignoresSafeArea(.all))
        }
    }
    
    func isValidTextField() -> Bool {
        return textField.count >= 3
    }
    
    func saveText() {
        dataArray.append(textField)
        textField = ""
    }
}

#Preview {
    TextFieldBootcamp()
}
