//
//  cat_appApp.swift
//  cat_app
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import SwiftUI
import Firebase

@main
struct cat_appApp: App {
    @StateObject var authRepository = AuthRepository()
    
    init() {
        //Call firebase on load
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authRepository)
        }
    }
}
