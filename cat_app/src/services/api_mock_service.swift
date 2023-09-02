//
//  api_mock_service.swift
//  cat_app
//
//  Created by Clement Babaniyi on 02/09/2023.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void){
        completion(result)
    }
}
