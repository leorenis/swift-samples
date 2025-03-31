//
//  SheetsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.green)
                    .font(.headline)
                    .padding()
                    .background(Color.white.cornerRadius(10))
            })
            /*.sheet(isPresented: $showSheet, content: {
                SecondScreenView() // Keep only a single Sheet here! DO NOT add conditional logic in this closure.
            })*/
            .fullScreenCover(isPresented: $showSheet, content: {
                // DO NOT ADD CONDITIONAL LOGIC!
                SecondScreenView()
            })
        }
    }
}

struct SecondScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                    .font(.headline)
                    .padding(20)
            })
        }
    }
}

#Preview {
    SheetsBootcamp()
}
