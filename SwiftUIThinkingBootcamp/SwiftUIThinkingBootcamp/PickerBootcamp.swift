//
//  PickerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 01/04/25.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selectedAge: String = "18"
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    init() {
        
        // Customization - Segmented Picker(). Be carefull with: UISegmentedControl
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        
        // #03 - Segmented Picker
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
                ForEach(filterOptions.indices, id: \.self) { index in
                    Text(filterOptions[index])
                        .tag(filterOptions[index])
                }
        })
            .pickerStyle(SegmentedPickerStyle())
            //.background(Color.red)
        
        
        // #02 - MenuPickerStyle
        Picker(
            selection: $selection,
            label:
                HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
            ,
            content: {
                ForEach(filterOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                        Image(systemName: "heart.fill")
                    }
                    .tag(option)
                }
        })
            .pickerStyle(MenuPickerStyle())
        
        
        
        // #01 - DefaultPickerStyle()
        VStack {
            HStack {
                Text("Age:")
                Text(selectedAge)
            }
            
            Picker(
                selection: $selectedAge,
                label: Text("Picker"),
                content: {
                    ForEach(18..<100) { age in
                        Text("\(age)")
                            .font(.title)
                            .foregroundColor(.red)
                            .tag("\(age)")
                    }
                }
            )
            .pickerStyle(DefaultPickerStyle())
        }
    }
}

#Preview {
    PickerBootcamp()
}
