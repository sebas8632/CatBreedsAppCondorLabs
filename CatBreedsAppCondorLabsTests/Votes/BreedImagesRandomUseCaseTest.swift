//
//  BreedImagesRandomUseCaseTest.swift
//  CatBreedsAppCondorLabsTests
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import XCTest

@testable
import CatBreedsAppCondorLabs

class BreedImagesRandomUseCaseTest: XCTestCase {
    
    
    var breedImagesRandomUseCase: FetchBreedImagesRandomUseCase!
    var diContainer: AppDIContainer!
    
    override func setUpWithError() throws {
        diContainer = AppDIContainer()
        breedImagesRandomUseCase = diContainer.makeFetchBreedImagesRandomUseCase()
    }
    
    override func tearDownWithError() throws {
        diContainer = nil
        breedImagesRandomUseCase = nil
    }
    
    func testBreedImagesRandom() {
        //When
        getBreedsImagesRandom { (result) in
            switch result {
            case .success(let breedsImages):
                //Then
                XCTAssertEqual(breedsImages.count, 2)
                XCTAssertEqual(breedsImages.first?.id, "abys")
            
            case .failure(_):
                XCTFail()
                
            }
        }
    }
    
    private func getBreedsImagesRandom(completion: @escaping ((Response<[BreedImage]>)-> Void)) {
        breedImagesRandomUseCase.execute(completion: completion)
    }
}
