//
//  FetchBreedsUseCase.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
class FetchBreedsUseCase{
    
    private let breedsRepository: BreedsRepository
    
    init(breedsRepository: BreedsRepository) {
        self.breedsRepository = breedsRepository
    }
}

extension FetchBreedsUseCase: UseCase {
    
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        breedsRepository.fetchBreeds { (result) in
            switch result {
            case .success(let breeds):
                completion(.success(breeds as! T))
            case .failure(let networkError):
                completion(.failure(ApplicationError.networkError(networkError: networkError.rawValue)))
            }
        }
    }
}
