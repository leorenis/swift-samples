//
//  TimerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 25/06/25.
//

import SwiftUI

/// Struct to training publisher subscriber using onreceive.
fileprivate struct TimerBootcamp: View {
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

fileprivate struct CountDownBootcamp: View {
    // MARK: PROPERTIES
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

fileprivate struct TimeRemainingBootcamp: View {
    // MARK: PROPERTIES
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State private var timeRemaing: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    var body: some View {
        TextRadialGradientView(content: $timeRemaing)
            .onReceive(timer, perform: { value in
                updateTimeRemaining()
            })
    }
    
    private func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
//         timeRemaing = String(format: "%02d:%02d:%02d", hour, minute, second) // Another way to show
        timeRemaing = "\(hour):\(minute):\(second)"
    }
}

fileprivate struct AnimationCounterBootcamp: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var count: Int = 0
    let range = 1..<4
    
    var body: some View {
        ZStack {
            PurpleRadialRadientView()
            
            HStack(spacing: 16) {
                ForEach(range, id: \.self) { index in
                    Circle()
                        .offset(y: count == index ? -20 : 0)
                        .overlay(Text("\(index)").font(.caption).foregroundColor(.primary))
                }
            }
            .frame(width: 150)
            .foregroundStyle(.white)
        }
    }
}

fileprivate struct TextRadialGradientView: View {
    @Binding var content: String
    var body: some View {
        ZStack {
            PurpleRadialRadientView()
            
            Text(content)
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
    }
}

fileprivate struct PurpleRadialRadientView: View {
    var body: some View {
        RadialGradient(
            colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))],
            center: .center,
            startRadius: 5,
            endRadius: 500
        )
        .ignoresSafeArea()
    }
}

// MARK: PREVIEW
#Preview {
    AnimationCounterBootcamp()
}
