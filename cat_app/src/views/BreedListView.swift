//
//  BreedListView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 30/08/2023.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var body: some View {
        NavigationView {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
            }.listStyle(PlainListStyle())
                .navigationTitle("Find Your Desired Cat")
        }
        
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
