//
//  BreedImageUseCase.swift
//  CatBreedsAppCondorLabsTests
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import XCTest
@testable
import CatBreedsAppCondorLabs

class BreedImageUseCaseTest: XCTestCase {
    
    var fetchBreedImageUseCase: FetchBreedImageUseCase!
    var diContainer: AppDIContainer!
    
    override func setUpWithError() throws {
        diContainer = AppDIContainer()
        fetchBreedImageUseCase = diContainer.makeFetchBreedImageUseCase()
        
    }
    
    override func tearDownWithError() throws {
        
        diContainer = nil
        fetchBreedImageUseCase = nil
    }
    
    
    func testA() {
        
        //Given
        fetchBreedImageUseCase.breedId = "abys"
        //When
        getBreedImage { (result) in
            
            switch result {
            case .success(let breedsImage):
                //Then
                XCTAssertEqual(breedsImage.count, 1)
                XCTAssertEqual(breedsImage.first?.id, "abys")
            case .failure( _):
                XCTFail()
            }
            
            
        }
    }
    
    private func getBreedImage(completion: @escaping ((Response<[BreedImage]>)-> Void)) {
        fetchBreedImageUseCase.execute(completion: completion)
    }
    
}
