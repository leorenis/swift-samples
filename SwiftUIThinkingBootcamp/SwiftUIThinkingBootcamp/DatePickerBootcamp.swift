//
//  DatePickerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 02/04/25.
//

import SwiftUI

struct DatePickerBootcamp: View {
    @State var selectedDate: Date = Date()
    var body: some View {
        NavigationStack {
            VStack (spacing: 10) {
                NavigationLink("Calendar", destination: MyCalendarView(selectedDate: $selectedDate))
                NavigationLink("Compacted Date", destination: MyCompactedDatePickerView(selectedDate: $selectedDate))
                NavigationLink("Displayer Component", destination: MyDisplayerComponentView(selectedDate: $selectedDate))
                NavigationLink("Range Component", destination: MyDatePickerRangeView(selectedDate: $selectedDate))
                NavigationLink("Date picker Formatter", destination: MyFormattedDatePicker(selectedDate: $selectedDate))
            }
            .padding(20)
            .navigationTitle(Text("Date Picker Bootcamp!"))
        }
    }
}


// Calendar View
struct MyCalendarView: View {
    
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker("Select a date", selection: $selectedDate)
            .accentColor(.brown)
            // .datePickerStyle(CompactDatePickerStyle())
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}
// Compact Style View
struct MyCompactedDatePickerView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker("Select a date", selection: $selectedDate)
    }
}

// Allow to display only part of date picker, e.g: time
struct MyDisplayerComponentView: View {
    
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker(
            "Select a data",
            selection: $selectedDate,
            displayedComponents: [
                //.date,
                .hourAndMinute,
            ]
        )
        .accentColor(.red)
    }
}

// Select a date only in a Range. Perfect for, pick a Birthday
struct MyDatePickerRangeView: View {
    @Binding var selectedDate: Date
    
    let startDate: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endsDate: Date = Date()
    
    var body: some View {
        DatePicker(
            "Select a Date",
            selection: $selectedDate,
            in: startDate...endsDate
        )
    }
}

// Select and Format DatePicker
struct MyFormattedDatePicker: View {
    
    @Binding var selectedDate: Date
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateStyle = .short
        //formatter.timeStyle = .short
        return formatter
    }
    var body: some View {
        VStack {
            Text("Selected date:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            MyCalendarView(selectedDate: $selectedDate)
        }
    }
}


#Preview {
    DatePickerBootcamp()
}
