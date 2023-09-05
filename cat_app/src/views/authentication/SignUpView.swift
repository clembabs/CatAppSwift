//
//  SignUpView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var authRepository : AuthRepository
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Image
                    Image("logo").resizable().scaledToFit()
                        .padding(.vertical, 32).frame(width: 300)
                    
                    //Form fields
                    VStack(spacing: 24) {
                        InputView(text: $email, title: "Email", placeholder: "name@example.com").autocapitalization(.none)
                        InputView(text: $fullName, title: "Full Name", placeholder: "Enter your full name")
                        InputView(text: $password, title: "Password", placeholder: "Enter your password",isSecure: true)
                        ZStack(alignment: .trailing) {
                            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password",isSecure: true)
                            
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                            }
                        }
                    }.padding(.horizontal)
                        .padding(.top, 32)
                    
                    //Sign in button
                    Button {
                        Task {
                            try await authRepository.createUser(withEmail:email, password: password,fullName: fullName)
                        }
                    }label: {
                        HStack {
                            Text("Sign Up").fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 32,height: 48)
                    }.background(Color(.systemBlue)).cornerRadius(10).padding(.vertical, 24)
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0 : 0.5)
                     
                   
                    Spacer()
                    
                    //Sign up button
                    Button {
                        dismiss()
                    }label: {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                            Text("Sign In").fontWeight(.bold)
                        }.font(.system(size: 14))
                    }
                }
            }
        }
    }
}

extension SignUpView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullName.isEmpty
        && confirmPassword == password
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
