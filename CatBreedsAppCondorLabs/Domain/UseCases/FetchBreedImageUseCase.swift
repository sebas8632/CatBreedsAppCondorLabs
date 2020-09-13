//
//  FetchBreedImageUseCase.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
class FetchBreedImageUseCase{

    private let breedImageRepository: BreedImagesRepository
    
    var breedId: String?
    
    init(breedImageRepository: BreedImagesRepository) {
        self.breedImageRepository = breedImageRepository
    }
}

extension FetchBreedImageUseCase: UseCase {
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        guard let name = self.breedId else {completion(.failure(ApplicationError.appError)); return }
        
        breedImageRepository.getBreedImage(by: name) { (result) in
            switch result {
            case .success(let breedImage):
                completion(.success(breedImage as! T))
            case .failure(let networkError):
                completion(.failure(ApplicationError.networkError(networkError: networkError.rawValue)))
            }
        }
    }
}
