//
//  ContentView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    var body: some View { 
        if breedFetcher.isLoaading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            BreedListView(breeds: breedFetcher.breeds)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
