//
//  BreedImagesRepository.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
protocol  BreedImagesRepository {
    
    func getBreedImage(by name: String, completion: @escaping ((NetworkResponse<BreedImage>) -> Void))

}
