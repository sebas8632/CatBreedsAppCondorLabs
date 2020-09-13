//
//  DefaultBreedsRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class DefaultBreedsRepository: BreedsRepository {
    
    let sessionProvider: URLSessionProvider
    
    init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }
    
    func fetchBreeds(completion: @escaping ((NetworkResponse<[Breed]>) -> Void)) {
        sessionProvider.request(type: [Breed].self, service: GetBreedsService.all, completion: completion)
    }
}
