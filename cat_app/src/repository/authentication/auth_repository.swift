//
//  auth_repository.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


@MainActor //Publishes all UI updates back on the main thread
class AuthRepository: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: AppUser?
    
    
    init() {
        //Caches the user session
        self.userSession = Auth.auth().currentUser
}
    
    func signIn(withEmail email: String, password: String) async throws {
       
    }
    
    func createUser(withEmail email: String, password: String,fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail:email, password: password)
            self.userSession = result.user
            
            let user = AppUser(id: result.user.uid, fullname: fullName, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
        } catch {
            print("Debug create \(error.localizedDescription)")
        }
    }
    
    func getUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
    }
    
    func signOut()  {
        
    }
    
    func deleteAccount()  {
        
    }
    
   
    
}
