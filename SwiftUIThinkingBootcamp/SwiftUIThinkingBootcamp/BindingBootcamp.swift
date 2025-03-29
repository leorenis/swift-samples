//
//  BindingBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 29/03/25.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "Let's binding"
    
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                ButtonActionView(
                    backgroundColor: $backgroundColor,
                    title: $title
                )
            }
        }
    }
}

struct ButtonActionView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    @State var buttonColor: Color = .blue
    
    var body: some View {
        Button(action: {
            backgroundColor = Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
            buttonColor = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
            title = "Binder works! 🎉"
        }, label: {
            Text("Button")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(buttonColor)
                .cornerRadius(10)
                
        })
    }
}

#Preview {
    BindingBootcamp()
}
