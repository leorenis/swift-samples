//
//  SafeArea.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        /*
        ZStack {
            // Background
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                //.padding(.top, 50)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            // .edgesIgnoringSafeArea(.all)
        }
        */
        
        // Safe area using ZStack
        /*
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Title goes here")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.white)
                            .frame(height: 150)
                            .shadow(radius: 10)
                            .padding(20)
                    }
                }
            }
        }
        // .background(Color.blue)
        */
        
        // Safe area using background on ScrollView
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        //.background(Color.blue)
        .background(
            Color.red
                //.edgesIgnoringSafeArea(.all) // deprecated
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    SafeAreaBootcamp()
}
