//
//  ContentView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authRepository : AuthRepository
    @StateObject var breedFetcher = BreedFetcher()
    
//    init() {
//           // Initialize breedFetcher only when userSession is not nil
//           if authRepository.userSession != nil {
//               _breedFetcher = StateObject(wrappedValue: BreedFetcher())
//           }
//       }
       
    var body: some View { 
        Group {
            if authRepository.userSession != nil {
                if breedFetcher.isLoaading {
                    LoadingView()
                } else if breedFetcher.errorMessage != nil {
                    ErrorView(breedFetcher: breedFetcher)
                } else {
                    BreedListView(breeds: breedFetcher.breeds)
                }
            } else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
