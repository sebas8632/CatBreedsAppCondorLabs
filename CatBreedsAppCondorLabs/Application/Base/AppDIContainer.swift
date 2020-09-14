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

//MARK: BreedsDetail Container

extension AppDIContainer {

    //MARK: View Model
    
    func makeBreedDetailViewModel() -> BreedDetailViewModel {
        return BreedDetailViewModel(fetchBreedImageUseCase: makeFetchBreedImageUseCase())
    }
    
    //MARK: Use Cases
    
    func makeFetchBreedImageUseCase() -> FetchBreedImageUseCase {
        return FetchBreedImageUseCase(breedImageRepository: makeBreedImageRepository())
    }
    
    //MARK: Repository
    
    func makeBreedImageRepository() -> BreedImagesRepository {
        return DefaultBreedsImageRepository(sessionProvider: urlSessionProvider)
    }
    
}

//MARK: Likes Container

extension AppDIContainer {
    
    //MARK: View Model
    
    func makeLikesViewModel() -> LikesViewModel {
        return LikesViewModel(fetchBreedImagesRandomUseCase: makeFetchBreedImagesRandomUseCase(), saveVoteUseCase: makeSaveVoteUseCase())
    }
    
    //MARK: Use Cases
    
    func makeFetchBreedImagesRandomUseCase() -> FetchBreedImagesRandomUseCase {
        return FetchBreedImagesRandomUseCase(breedImageRepository: makeBreedImageRepository())
    }
    
    func makeSaveVoteUseCase() -> SaveVoteUseCase {
        return SaveVoteUseCase(votesRepository: makeVotesRepository())
    }
    
    //MARK: Repository

    func makeVotesRepository() -> VotesRepository {
        return DefaultVotesRepository(sessionProvider: urlSessionProvider)
    }
}

