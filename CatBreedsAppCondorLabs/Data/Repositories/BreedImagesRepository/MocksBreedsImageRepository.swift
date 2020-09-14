//
//  MocksBreedsImageRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class MocksBreedsImageRepository: BreedImagesRepository {
    
    func getBreedImage(by name: String, completion: @escaping ((NetworkResponse<[BreedImage]>) -> Void)) {
        if name == "abys" {
            let breedImage = BreedImage(id: name, imageUrl: "https://cdn2.thecatapi.com/images/387.jpg")
            completion(.success([breedImage]))
        } else if name == "aege" {
            let breedImage = BreedImage(id: name, imageUrl: "https://cdn2.thecatapi.com/images/NwMUoJYmT.jpg")
            completion(.success([breedImage]))
        } else {
            completion(.failure(NetworkError.serverError))
        }
    }
    
    func getBreedsImageRandom(completion: @escaping ((NetworkResponse<[BreedImage]>) -> Void)) {
        let breedImage = BreedImage(id: "abys", imageUrl: "https://cdn2.thecatapi.com/images/387.jpg")
        let breedImage2 = BreedImage(id: "abys", imageUrl: "https://cdn2.thecatapi.com/images/NwMUoJYmT.jpg")

        completion(.success([breedImage, breedImage2]))
    }
    
    
}
