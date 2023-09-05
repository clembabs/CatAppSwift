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
                        InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password",isSecure: true)
                    }.padding(.horizontal)
                        .padding(.top, 32)
                    
                    //Sign in button
                    Button {
                       
                    }label: {
                        HStack {
                            Text("Sign Up").fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 32,height: 48)
                    }.background(Color(.systemBlue)).cornerRadius(10).padding(.vertical, 24)
                     
                   
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
