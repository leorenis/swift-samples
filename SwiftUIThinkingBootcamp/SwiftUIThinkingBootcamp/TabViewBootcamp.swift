//
//  TabViewBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 03/04/25.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    var body: some View {
        // MyDefaultTabView(selectedTab: $selectedTab)
        // MyPageTabView()
        MyCarouselTabView()
    }
}

enum TabViewType {
    case home, received, account
    
    var rawValue: Int {
        switch self {
        case .home: return 0
        case .received: return 1
        case .account: return 2
        }
    }
}

// Home Tab View
struct HomeTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Home page")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Button(action: {
                    selectedTab = TabViewType.account.rawValue
                }, label: {
                    Text("Go to account")
                        .padding(16)
                        .padding(.horizontal, 20)
                        .foregroundColor(.white)
                        .background(Color.blue.cornerRadius(4))
                        .font(.headline)
                        
                })
            }
        }
    }
}

// View #01 - My Default TabView
struct MyDefaultTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: 0) {
                HomeTabView(selectedTab: $selectedTab)
            }
            
            Tab("Received", systemImage: "tray.and.arrow.down.fill", value: 1) {
                Text("Received page")
            }
            .badge(2)
            
            Tab("Account", systemImage: "person.crop.circle.fill", value: 2) {
                Text("Account page")
            }
            .badge("!")
        }.tint(.blue)
    }
}

// View #02 - My Page TabView
struct MyPageTabView: View {
    var body: some View {
        TabView {
            Tab(){
                ZStack{
                    Color.red
                        .ignoresSafeArea(.all)
                }
            }
            Tab(){
                RoundedRectangle(cornerRadius: 20)
            }
            Tab(){
                RoundedRectangle(cornerRadius: 20)
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

// View #03 - My Page TabView
struct MyCarouselTabView: View {
    
    let icons: [String] = ["globe", "person.fill", "heart.fill", "cart"]
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea(.all)
            
            TabView {
                ForEach(icons, id: \.self) { icon in
                    Tab(){
                        ZStack{
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .padding(32)
                                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(
                            Color(.white).opacity(0.2).cornerRadius(20)
                        )
                        .padding(.all, 16)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
        }
    }
}

#Preview {
    TabViewBootcamp()
}
