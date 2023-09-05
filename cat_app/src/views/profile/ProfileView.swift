//
//  ProfileView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section{
                HStack {
                    Text(AppUser.MOCK_USER.initials)
                        .font(.title).fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                    .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(AppUser.MOCK_USER.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text(AppUser.MOCK_USER.email)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
 
