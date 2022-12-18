//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 15.12.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var appState = AppState()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
            .environmentObject(appState)
        }
    }
}
