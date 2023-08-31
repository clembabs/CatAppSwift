//
//  ErrorView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 30/08/2023.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack{
            Text("😭").font(.system(size:80))
            Text(breedFetcher.errorMessage ?? "Error ......")
            Button {
                breedFetcher.fetchAllCatBreeds()
            } label: {
                Text("Try Again").padding([.bottom, .top], 20)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
