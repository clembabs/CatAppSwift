//
//  breed_row.swift
//  cat_app
//
//  Created by Clement Babaniyi on 31/08/2023.
//

import SwiftUI

struct BreedRow: View {
    var breed: Breed
    var body: some View {
        Text(breed.name)
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
    }
}
