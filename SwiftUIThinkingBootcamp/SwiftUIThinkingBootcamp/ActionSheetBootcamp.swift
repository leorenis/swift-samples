//
//  ActionSheetBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .otherPost
    
    enum ActionSheetOptions {
        case myPost
        case otherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                
                Button(action: {
                    actionSheetOption = .otherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }.actionSheet(isPresented: $showActionSheet, content: actionSheet)
    }
    
    func actionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // add code to share this post
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // Add code to report this post
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // Add code to report this post
        }
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What would you like to do?")
        
        switch actionSheetOption {
        case .myPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, deleteButton, cancelButton]
            )
        case .otherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton]
            )
        }
        /*
         return ActionSheet(
            title: Text("Action Sheet"),
            message: Text("This is an action sheet"),
            buttons: [
                .destructive(Text("Delete")) {},
                .cancel()
            ]
        )
        */
    }
}

#Preview {
    ActionSheetBootcamp()
}
