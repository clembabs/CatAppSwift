//
//  api_service_protocol.swift
//  cat_app
//
//  Created by Clement Babaniyi on 02/09/2023.
//

import Foundation


protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
