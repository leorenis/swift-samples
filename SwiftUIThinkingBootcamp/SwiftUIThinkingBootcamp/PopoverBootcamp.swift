//
//  PopoverBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

// Sheets
// Animations
// Transitions

import SwiftUI

struct PopoverBootcamp: View {
    
    @State var sheetMode: SheetMode = SheetMode()
    
    var body: some View {
        ZStack (alignment: .top) {
            // Screen color
            Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
                .ignoresSafeArea(edges: .all)
            
            // Show buttons
            HStack {
                let buttons: [ButtonView] = [
                    ButtonView(id: 1, title: "Sheet", color: Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)), sheetType: .sheet, sheetMode: $sheetMode),
                    ButtonView(id: 2, title: "Transition", color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), sheetType: .transition, sheetMode: $sheetMode),
                    ButtonView(id: 3, title: "Animation", color: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), sheetType: .animation, sheetMode: $sheetMode),
                ]
                ForEach(buttons) { button in
                    button
                }
            }
            .padding(.top, 10)
            
            // METHOD 02 - Transition
            transitionLayer
            
            // METHOD 03 - Animation
            animationLayer
            
        }
        // METHOD 01 - Sheet
        .sheet(isPresented: $sheetMode.sheet, content: {
            ScreenSheetView(sheetType: .sheet, sheetMode: $sheetMode)
        })
    }
    
    var transitionLayer: some View {
        ZStack {
            if sheetMode.transition {
                ScreenSheetView(sheetType: .transition, sheetMode: $sheetMode)
                    .padding(.top, 100)
                    .transition(.move(edge: .bottom))
                    // .animation(.spring())
            }
        }.zIndex(2.0)
    }
    
    var animationLayer: some View {
        ZStack {
            ScreenSheetView(sheetType: .animation, sheetMode: $sheetMode)
                .padding(.top, 100)
                .offset(y: sheetMode.animation ? 0 : UIScreen.main.bounds.height)
        }
    }
}

struct ScreenSheetView: View {
    let sheetType: SheetType
    @Binding var sheetMode: SheetMode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            sheetMode.getColor(type: sheetType)
                .ignoresSafeArea(edges: .all)
            
            Button(action: {
                // presentationMode.wrappedValue.dismiss()
                withAnimation(.spring()) {
                    sheetMode.toggle(type: sheetType)
                }
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
                    .padding()
            })
        }
    }
}

struct ButtonView: View, Identifiable {
    let id: Int
    let title: String
    let color: Color
    let sheetType: SheetType
    @Binding var sheetMode: SheetMode
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                sheetMode.toggle(type: sheetType)
            }
        }, label: {
            Text(title.uppercased())
                .font(.body)
                .padding()
                .foregroundColor(.white)
                .background(color.cornerRadius(10))
        })
    }
}

enum SheetType {
    case sheet, transition, animation
}

struct SheetMode {
    var sheet: Bool = false
    private(set) var transition: Bool = false
    private(set) var animation: Bool = false
    
    mutating func toggle(type: SheetType) {
        switch type {
        case .sheet: sheet.toggle();
        case .transition: transition.toggle();
        case .animation: animation.toggle();
        }
    }
    
    func getColor(type: SheetType) -> Color {
        switch type {
        case .animation: return Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1));
        case .transition: return Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1));
        default: return Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1));
        }
    }
}

#Preview {
    PopoverBootcamp()
}
