//
//  FetchBreedImagesRandomUseCase.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class FetchBreedImagesRandomUseCase: UseCase
{    
    private let breedImageRepository: BreedImagesRepository
    
    
    init(breedImageRepository: BreedImagesRepository) {
        self.breedImageRepository = breedImageRepository
    }
    
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        breedImageRepository.getBreedsImageRandom { (result) in
            switch result {
            case .success(let breedsImages):
                completion(.success(breedsImages as! T))
            case .failure(let error):
                completion(.failure(ApplicationError.networkError(networkError: error.rawValue)))
            }
        }
    }
    
    
}
