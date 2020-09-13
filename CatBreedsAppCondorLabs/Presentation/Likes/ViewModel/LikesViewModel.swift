//
//  LikesViewModel.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

protocol LikesViewModelDelegate {
    func showImage(url: String)
}


class LikesViewModel {
    
    private var fetchBreedImagesRandomUseCase: FetchBreedImagesRandomUseCase
    
    var breedsImages: [BreedImage] = []
    
    var errorManager: ErrorManagerProtocol?
    
    var delegate: LikesViewModelDelegate?
    
    init(fetchBreedImagesRandomUseCase: FetchBreedImagesRandomUseCase) {
        self.fetchBreedImagesRandomUseCase = fetchBreedImagesRandomUseCase
    }
}

extension LikesViewModel {
    
    func getImagesRandom() {
        
        didFetchImagesRandom { [weak self] (result) in
            
            guard let strongSelf = self else { self?.errorManager?.manageError(error: ApplicationError.appError); return}
            
            switch result {
            case .success(let breedsImages):
                strongSelf.breedsImages = breedsImages
                strongSelf.delegate?.showImage(url: breedsImages.first!.imageUrl)
                break
            case .failure(let error):
                strongSelf.errorManager?.manageError(error: error)
                break
            }
        }
    }
    
    func didFetchImagesRandom(completion: @escaping ((Response<[BreedImage]>)-> Void)) {
        fetchBreedImagesRandomUseCase.execute(completion: completion)
    }
    
}
