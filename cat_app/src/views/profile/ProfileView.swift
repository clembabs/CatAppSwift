//
//  ProfileView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authRepository: AuthRepository
    var body: some View {
        if let user = authRepository.currentUser {
            List {
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title).fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray))
                        .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                
                    }
                    }
                    
                }
                
                Section("General"){
                    HStack {
                        SettingsRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button {
                        authRepository.signOut()
                    }label: {
                        SettingsRow(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                    }
                    Button {
                   
                    }label: {
                        SettingsRow(imageName: "xmark.bin.circle.fill", title: "Delete Account", tintColor: Color(.red))
                    }
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
 
