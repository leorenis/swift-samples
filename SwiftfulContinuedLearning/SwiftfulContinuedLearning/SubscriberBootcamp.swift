//
//  SubscriberBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 26/06/25.
//

import SwiftUI
import Combine

// MARK: VIEW MODELS
@Observable class SubscriberViewModel {
    var count: Int = 0
    var timer: AnyCancellable?
    
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                if self.count >= 10 {
                    self.timer?.cancel()
                }
            }
    }
}

/// Struct to learning about Subscriber Pulish using Combine framework.
struct SubscriberBootcamp: View {
    // MARK: PROPERTIES
    @State var vm = SubscriberViewModel()
    
    // MARK: BODY
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

// MARK: PREVIEW
#Preview {
    SubscriberBootcamp()
}
