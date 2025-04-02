//
//  NavigationViewBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        
        // Use NavigationStack and NavigationSplitView instead NavigationView. For more information, see Migrating to new navigation types.
        NavigationStack {
            ScrollView {
                NavigationLink("Menu 1", destination: DestinationView())
            }
            .navigationTitle("All inboxes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: DestinationView(),
                        label: {
                            Image(systemName: "gear")
                        }
                    )
               }
            }
        }
    }
}

struct DestinationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(edges: .all)
                .navigationTitle(Text("Green screen!"))
                .navigationBarHidden(true)
            
            VStack {
                Button("< Back button") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Next >", destination: Text("3rd screen"))
            }
        }
    }
}
#Preview {
    NavigationViewBootcamp()
}
