//
//  breed_row.swift
//  cat_app
//
//  Created by Clement Babaniyi on 31/08/2023.
//

import SwiftUI

struct BreedRow: View {
    var breed: Breed
    let imageSize: CGFloat = 100
    var imageUrl: String? = "https://cdn2.thecatapi.com/images/unX21IBVB.jpg"
    var body: some View {
        HStack {
            
//            breed.image?.url
                  if imageUrl != nil {
                      AsyncImage(url: URL(string: imageUrl!)) { phase in
                          if let image = phase.image {
                              image.resizable()
                                  .scaledToFill()
                                  .frame(width: imageSize, height: imageSize)
                                  .clipped()
                              
                           } else if phase.error != nil {
                               
                               Text(phase.error?.localizedDescription ?? "error")
                                   .foregroundColor(Color.pink)
                                   .frame(width: imageSize, height: imageSize)
                           } else {
                              ProgressView()
                                   .frame(width: imageSize, height: imageSize)
                           }
                          
                      }
                  }else {
                      Color.gray.frame(width: imageSize, height: imageSize)
                  }
                  
                  VStack(alignment: .leading, spacing: 5) {
                      Text(breed.name)
                          .font(.headline)
                      Text(breed.temperament)
                  }
              }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
                    .previewLayout(.fixed(width: 400, height: 200))
    }
}
