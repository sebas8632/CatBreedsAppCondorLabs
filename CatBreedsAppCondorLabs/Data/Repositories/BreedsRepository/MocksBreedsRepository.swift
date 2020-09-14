//
//  MocksBreedsRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

class  MocksBreedsRepository: BreedsRepository {
    func fetchBreeds(completion: @escaping ((NetworkResponse<[Breed]>) -> Void)) {
        let breed1 = Breed(id: "abys", name: "Abyssinian", origin: "Egypt", wikipediaUrl: "https://en.wikipedia.org/wiki/Abyssinian_(cat)", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.")
        
        let breed2 = Breed(id: "aege", name: "Aegean", origin: "Greece", wikipediaUrl: "https://en.wikipedia.org/wiki/Aegean_cat", description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.")
        
        completion(.success([breed1, breed2]))
    }
    
    
}
