//
//  TimerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 25/06/25.
//

import SwiftUI

/// Struct to training publisher subscriber using onreceive.
struct TimerBootcamp: View {
    // MARK: PROPERTIES
    @State private var currentDate: Date = Date()
    @State private var currentDateFormatted: String = ""
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
//        formatter.dateFormat = "HH:mm:ss" // Just the same above line.
        return formatter
    }
    
    // MARK: BODY
    var body: some View {
        TextRadialGradientView(content: $currentDateFormatted)
        .onReceive(timer, perform: { value in
           currentDate = value
            currentDateFormatted = dateFormatter.string(from: currentDate)
        })
    }
}

struct CountDownBootcamp: View {
    @State private var currentDate: Date = Date()
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Countdown
    @State private var count: Int = 10
    @State private var finishedText: String = "10"
    
    var body: some View {
        TextRadialGradientView(content: $finishedText)
        .onReceive(timer, perform: { value in
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
                finishedText = "\(count)"
            }
        })
    }
}

fileprivate struct TextRadialGradientView: View {
    @Binding var content: String
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))],
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text(content)
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
    }
}

// MARK: PREVIEW
#Preview {
    TimerBootcamp()
}
