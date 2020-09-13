//
//  AppDIContainer.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

final class AppDIContainer {
    
    //MARK: Network
    
    lazy var urlSessionProvider: URLSessionProvider = URLSessionProvider()
    
}

//MARK: BreedList Container
extension AppDIContainer {
    
    //MARK: View Model
    
    func makeBreedsListViewModel() -> BreedsListViewModel {
        return BreedsListViewModel(fetchBreedsUseCase: makeFetchBreedsUseCase())
    }
    
    //MARK: Use Cases
    
    func makeFetchBreedsUseCase() -> FetchBreedsUseCase {
        return FetchBreedsUseCase(breedsRepository: makeBreedsRepository())
    }
    
    //MARK: Repositories
    
    func makeBreedsRepository() -> BreedsRepository {
        return DefaultBreedsRepository(sessionProvider: urlSessionProvider)
    }
}
