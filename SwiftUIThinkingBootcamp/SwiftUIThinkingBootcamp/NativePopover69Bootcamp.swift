//
//  NativePopover69Bootcamp.swift
//  SwiftUIThinkingBootcamp
// episode: https://youtu.be/bW7N8ACCc6A?si=-oxX6z43B-2wcqnZ
//
//  Created by Leo on 14/04/25.
//

import SwiftUI

/// The popover modifier let's us show a View popping over an existing View on the screen. This intuitive UI can bring better user experiences to your application
struct NativePopover69Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var showPopover: Bool = false
    
    var body: some View {
        ZStack {
            // Background
            Color.white
                .ignoresSafeArea(edges: .all)
            
            // Foreground
            VStack {
                Spacer()
                Button("Click me") {
                    showPopover.toggle()
                }
                .padding()
                .background(Color.yellow)
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), content: {
                    Text("Hello, popover!")
                        .padding()
                        .presentationCompactAdaptation(.popover)
                })
    //            .popover(isPresented: $showPopover) {
    //                Text("Hello, popover!")
    //                    .padding()
    //                    .presentationCompactAdaptation(.popover)
    //            }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    NativePopover69Bootcamp()
}
