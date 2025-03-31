//
//  AlertBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var bgColor: Color = .yellow
    @State var alertType: AlertType? = nil
    
    // @State var alertTitle: String = ""
    // @State var alertMessage: String = ""
    
    enum AlertType {
        case success, error
    }
    
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Button("Click error") {
                    alertType = .error
                    //alertTitle = "ERROR UPLOADING VIDEO"
                    //alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert, content: alert)
                
                Button("Click success") {
                    alertType = .success
                    //alertTitle = "Successfully uploaded video 🥳"
                    //alertMessage = "Your video is now public!"
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert, content: alert)
            }
        }
    }
    
    func alert() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error!"))
        case .success:
            return Alert(
                title: Text("This was a success!"),
                message: nil,
                dismissButton: .default(
                    Text("OK"),
                    action: {
                        bgColor = .green
                    }
                )
            )
        default: return Alert(title: Text("Error"))
        }
        //        return Alert(
        //            title: Text(alertTitle),
        //            message: Text(alertMessage),
        //            dismissButton: .default(Text("OK")))
        //        return Alert(
        //            title: Text("This is the title"),
        //            message: Text("Here we will describe the error."),
        //            primaryButton: .destructive(Text("Delete"), action: {
        //                backgroundColor = .red
        //            }),
        //            secondaryButton: .cancel())
        //      Alert(title: Text("There was an error!"))
    }
}

#Preview {
    AlertBootcamp()
}
