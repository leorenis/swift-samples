//
//  NavigationStack62Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo 11/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing Navigation Stack.
struct NavigationStack62Bootcamp: View {
    
    // MARK: PROPERTIES
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        /**
                         * Caution:
                         * - EAGER aproach. ISSUE: All my destination view is been Loading when NavigationStack used.
                         *   e.g:
                         *      NavigationLink(destination: MyDetailDestinationView(value: index)) {
                         *          Text("Click me \(index)")
                         *      }
                         *
                         * Solution:
                         * - LAZY: See the current aproach.
                         *  e.g:
                         *      NavigationLink(value: index) {...}
                         */
                        NavigationLink(value: index) {
                            Text("Click me \(index)")
                        }
                    }
                    
                    /**
                     * Lets try another fruits array, now
                     *  Huum... The link does't works!! Why?
                     *      Because the navigationDestination expect for Int.self. I MUST add a new .navigationDestination(for: String.self
                     *
                     *  We can have multiple destination for multiple datatypes!!
                     */
                    let fruits: [String] = ["Banana", "Peaches", "Pear", "Orange", "Guava", "Papaya"]
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text("Link: \(fruit)")
                        }
                    }
                }
            }
            .navigationTitle("Navigation stack")
            .navigationDestination(for: Int.self) { value in
                MyDetailDestinationView(value: value)
            }
            .navigationDestination(for: String.self) { fruit in
                Text(fruit)
            }
        }
    }
}

/// A data struct to provide a view to details.

struct MyDetailDestinationView: View {
    
    // MARK: PROPERTIES
    let value: Int
    
    init (value: Int) {
        self.value = value
        print("SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Detail \(value)")
    }
}
// MARK: PREVIEW
#Preview {
    NavigationStack62Bootcamp()
}
