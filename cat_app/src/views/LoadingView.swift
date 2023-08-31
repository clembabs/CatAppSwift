//
//  LoadingView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 30/08/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("🚀🚀🚀......").font(.system(size: 20))
            ProgressView()
            Text("Loading .......").foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
