//
//  breed_repository.swift
//  cat_app
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import Foundation


class BreedFetcher: ObservableObject {
    @Published var breeds: [Breed] = []
    @Published var isLoaading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    let service: APIServiceProtocol
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllCatBreeds()
    }
    
    func fetchAllCatBreeds() {
        isLoaading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchBreeds(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoaading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let breeds):
                    self.breeds = breeds
                    print(breeds.first?.image?.url)
                }
            }
        }
       
    }
    
    static func errorState() -> BreedFetcher {
          let fetcher = BreedFetcher()
          fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
          return fetcher
      }
      
      static func successState() -> BreedFetcher {
          let fetcher = BreedFetcher()
          fetcher.breeds = [Breed.example1(), Breed.example2()]
          
          return fetcher
      }
 }


