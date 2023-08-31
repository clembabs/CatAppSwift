//
//  BreedDetailView.swift
//  cat_app
//
//  Created by Clement Babaniyi on 31/08/2023.
//

import SwiftUI

struct BreedDetailView: View {
    let breed:Breed
    var body: some View {
        Text(breed.name)
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example1())
    }
}
