//
//  PocketPlanetIosApp.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI
import Firebase

@main
struct PocketPlanetIosApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var firestoreManager = FirestoreManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NavigationRouter()
            }
            .environmentObject(authViewModel)
            .environmentObject(firestoreManager)
        }
    }
}
