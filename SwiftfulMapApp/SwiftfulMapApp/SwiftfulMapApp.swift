//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import SwiftUI

@main
struct SwiftfulMapApp: App {
    // MARK: PROPERTIES
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
