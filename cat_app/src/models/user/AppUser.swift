//
//  AppUser.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import Foundation


struct AppUser: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        //Format name to eg C.B
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension AppUser {
    static var MOCK_USER = AppUser(id: NSUUID().uuidString, fullname: "Clement Babaniyi", email: "clement.babaniyi@gmail.com")
}
