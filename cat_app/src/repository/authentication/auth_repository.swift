//
//  auth_repository.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthFormProtocol {
    var formIsValid: Bool { get }
}


@MainActor //Publishes all UI updates back on the main thread
class AuthRepository: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: AppUser?
    
    
    init() {
        //Caches the user session
        self.userSession = Auth.auth().currentUser
        Task {
            await getUser()
        }
}
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await getUser()
        }catch {
            print("DEBUG: login failed \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String,fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail:email, password: password)
            self.userSession = result.user
            
            let user = AppUser(id: result.user.uid, fullname: fullName, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            await getUser()
        } catch {
            print("DEBUG: create user failed \(error.localizedDescription)")
        }
    }
    
    func getUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard  let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: AppUser.self)
        print("DEBUG: getting user \(self.currentUser)")
    }
    
    func signOut()  {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: signout failed \(error.localizedDescription)")
        }
    }
    
    func deleteAccount()  {
        
    }
    
    
   
    
}
