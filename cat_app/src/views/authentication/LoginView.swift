//
//  LoginView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 04/09/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authRepository : AuthRepository
    var body: some View {
        NavigationStack {
            VStack {
                //Image
                Image("logo").resizable().scaledToFit()
                    .padding(.vertical, 32).frame(width: 300)
                
                //Form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email", placeholder: "name@example.com").autocapitalization(.none)
                    InputView(text: $password, title: "Password", placeholder: "Enter your password",isSecure: true)
                }.padding(.horizontal)
                    .padding(.top, 32)
                
                //Sign in button
                Button {
                    Task {
                        try await authRepository.signIn(withEmail:email, password: password)
                    }
                }label: {
                    HStack {
                        Text("Sign In").fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 32,height: 48)
                }.background(Color(.systemBlue)).cornerRadius(10).padding(.top, 24)
                 
               
                Spacer()
                
                //Sign up button
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up").fontWeight(.bold)
                    }.font(.system(size: 14))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
