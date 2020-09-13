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
    var breedName: String?
    var image: UIImageView?
    
    
    init(fetchBreedImageUseCase: FetchBreedImageUseCase) {
        self.fetchBreedImageUseCase = fetchBreedImageUseCase
        fetchBreedImageUseCase.breedName = breedName
    }
}

extension BreedDetailViewModel {
    
    func getBreedImageURL() {
        didFetchBreedImage { (result) in
            switch result {
            case .success(let breedImage):
                
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func didFetchBreedImage(completion: @escaping ((Response<BreedImage>)-> Void)) {
        fetchBreedImageUseCase.execute(completion: completion)
    }
}
