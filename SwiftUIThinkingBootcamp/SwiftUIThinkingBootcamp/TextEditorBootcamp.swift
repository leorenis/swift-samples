//
//  TextEditorBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 01/04/25.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditor: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
        ZStack {
            NavigationStack {
                    VStack {
                        TextEditor(text: $textEditor)
                            .frame(height: 300)
                            //.font(.headline)
                            .colorMultiply(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .cornerRadius(10)
                        
                        Button(action: {
                            savedText = textEditor
                        }, label: {
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
                        
                        Text(savedText)
                        
                        Spacer()
                    }
                    .navigationTitle("TextEditor Bootcamp!")
                    .padding()
                    .background(
                        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                            .ignoresSafeArea(.all)
                    )
            }
        }
    }
}

#Preview {
    TextEditorBootcamp()
}
