//
//  BreedDetailViewModel.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit
class BreedDetailViewModel {
    
    private var fetchBreedImageUseCase: FetchBreedImageUseCase

    var breed: Breed?
    
    var errorManager: ErrorManagerProtocol?
    
    init(fetchBreedImageUseCase: FetchBreedImageUseCase) {
        self.fetchBreedImageUseCase = fetchBreedImageUseCase
//        fetchBreedImageUseCase.breedId = breed?.id
    }
}

extension BreedDetailViewModel {
    
    func getBreedImageURL(completion: @escaping ((_ urlImage: String) -> Void)) {
        didFetchBreedImage { [weak self] (result) in
            guard let strongSelf = self, let _ = strongSelf.breed else { self?.errorManager?.manageError(error: ApplicationError.appError); return}
            switch result {
            case .success(let breedImage):
                completion(breedImage.first!.imageUrl)
                break
            case .failure(let error):
                strongSelf.errorManager?.manageError(error: error)
                break
            }
        }
    }
    
   private func didFetchBreedImage(completion: @escaping ((Response<[BreedImage]>)-> Void)) {
    fetchBreedImageUseCase.breedId = self.breed?.id
        fetchBreedImageUseCase.execute(completion: completion)
    }
}
