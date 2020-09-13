//
//  UseCase.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
typealias Response<T> = Result<T,ApplicationError>

protocol UseCase {
    func execute<T>(completion: @escaping ((Response<T>) -> Void))
}
