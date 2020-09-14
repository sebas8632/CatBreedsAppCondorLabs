//
//  BreedsUseCaseTest.swift
//  CatBreedsAppCondorLabsTests
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import XCTest
@testable
import CatBreedsAppCondorLabs

class BreedsUseCaseTest: XCTestCase {

     var fetchBreedsUseCase: FetchBreedsUseCase!
       var diContainer: AppDIContainer!
       
       override func setUpWithError() throws {
           diContainer = AppDIContainer()
           fetchBreedsUseCase = diContainer.makeFetchBreedsUseCase()
           
       }
       
       override func tearDownWithError() throws {
           
           diContainer = nil
           fetchBreedsUseCase = nil
       }
    
    func testgetBreeds() {
        //When
        getBreeds { (result) in
            switch result {
            case .success(let breeds):
                //Then
                XCTAssertEqual(breeds.count, 2)
                XCTAssertEqual(breeds.first?.name, "Abyssinian")
                XCTAssertEqual(breeds.first?.origin, "Egypt")
                
            case .failure(_):
                XCTFail()
            }
        }
    }

    private func getBreeds(completion: @escaping ((Response<[Breed]>)-> Void)) {
        fetchBreedsUseCase.execute(completion: completion)
    }

}
