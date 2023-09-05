//
//  SettingsRow.swift
//  cat_app
//
//  Created by Clement Babaniyi on 05/09/2023.
//

import SwiftUI

struct SettingsRow: View {
    let imageName: String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
