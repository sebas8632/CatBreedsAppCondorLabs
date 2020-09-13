//
//  DefaultBreedsImageRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
class DefaultBreedsImageRepository: BreedImagesRepository {
    
    let sessionProvider: URLSessionProvider
    
    init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }
    
    func getBreedImage(by name: String, completion: @escaping ((NetworkResponse<[BreedImage]>) -> Void)) {
        sessionProvider.request(type: [BreedImage].self, service: GetBreedImageService.images(id: name), completion: completion)
    }
    
    func getBreedsImageRandom(completion: @escaping ((NetworkResponse<[BreedImage]>) -> Void)) {
        sessionProvider.request(type: [BreedImage].self, service: GetBreedImageService.random, completion: completion)
    }
    
}
