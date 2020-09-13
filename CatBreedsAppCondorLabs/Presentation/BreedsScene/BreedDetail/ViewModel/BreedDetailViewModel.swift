//
//  BreedDetailViewModel.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class BreedDetailViewModel {
    
    private var fetchBreedImageUseCase: FetchBreedImageUseCase
    var breedName: String?
    
    
    init(fetchBreedImageUseCase: FetchBreedImageUseCase) {
        self.fetchBreedImageUseCase = fetchBreedImageUseCase
        fetchBreedImageUseCase.breedName = breedName
    }
}

extension BreedDetailViewModel {
    
    func fetchBreedImage(completion: @escaping ((Response<BreedImage>)-> Void)) {
        fetchBreedImageUseCase.execute(completion: completion)
    }
}
