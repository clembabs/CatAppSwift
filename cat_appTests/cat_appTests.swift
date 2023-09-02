//
//  cat_appTests.swift
//  cat_appTests
//
//  Created by Clement Babaniyi on 29/08/2023.
//

import XCTest
import Combine
@testable import cat_app

final class cat_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        subscriptions = []
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    var subscriptions = Set<AnyCancellable>()

    func testBreedsSuccess() throws {
        let result = Result<[Breed],APIError>.success([Breed.example1()])
        let fetcher = BreedFetcher(service: APIMockService(result: result))
        let promise = expectation(description: "Getting Breeds")
        
        fetcher.$breeds.sink{ breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2 )
    }

    func testLoadingError() {
           
             let result = Result<[Breed], APIError>.failure(APIError.badURL)
             let fetcher = BreedFetcher(service: APIMockService(result: result))
             
            let promise = expectation(description: "show error message")
            fetcher.$breeds.sink { breeds in
                if !breeds.isEmpty {
                    XCTFail()
                }
            }.store(in: &subscriptions)
            
            
            fetcher.$errorMessage.sink { message in
                if message != nil {
                    promise.fulfill()
                }
            }.store(in: &subscriptions)
            
            wait(for: [promise], timeout: 2)
            
        }

}
