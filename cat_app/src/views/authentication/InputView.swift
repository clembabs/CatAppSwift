//
//  InputView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 04/09/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecure = false
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).foregroundColor(Color(.darkGray)).fontWeight(.semibold).font(.footnote)
            if isSecure {
                SecureField(placeholder, text: $text).font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text).font(.system(size: 14))
            }
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email", placeholder: "name@example.com")
    }
}
