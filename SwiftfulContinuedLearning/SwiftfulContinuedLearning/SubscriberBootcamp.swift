//
//  SubscriberBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 26/06/25.
//

import SwiftUI
import Combine

// MARK: VIEW MODELS
class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var isTextFieldValid: Bool = false
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer() // This timer running together with addTextField... cause a BUG, because they share same cancellables and here we use item.cancel(). So, this is just a test porpuse.
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                return text.count > 3
            }
//            .assign(to: \.isTextFieldValid, on: self) // When we use assing, we have to pass on: self, and create a strong reference. So, we should avoid this and use sink {[weak self]}.
            .sink(receiveValue: { [weak self] (isValid) in
                self?.isTextFieldValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                if self.count >= 180 {
                    for item in self.cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $isTextFieldValid
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else { return }
                self.showButton = isValid && count >= 10
            }
            .store(in: &cancellables)
    }
}

/// Struct to learning about Subscriber Pulish using Combine framework.
struct SubscriberBootcamp: View {
    // MARK: PROPERTIES
    @StateObject var vm = SubscriberViewModel()
    
    // MARK: BODY
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
//            Text(vm.isTextFieldValid.description)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding()
                .frame(height: 55)
                .font(.headline)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    Group {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1
                                ? 0.0
                                : vm.isTextFieldValid ? 0.0 : 1.0
                            )
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.isTextFieldValid ? 1.0 : 0.0)
                    }
                    .padding(.trailing, 8)
                    ,alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)
        }
        .padding()
    }
}

// MARK: PREVIEW
#Preview {
    SubscriberBootcamp()
}
