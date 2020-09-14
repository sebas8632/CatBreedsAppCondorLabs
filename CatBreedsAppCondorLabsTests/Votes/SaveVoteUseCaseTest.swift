//
//  SaveVoteUseCaseTest.swift
//  CatBreedsAppCondorLabsTests
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import XCTest
@testable
import CatBreedsAppCondorLabs

class SaveVoteUseCaseTest: XCTestCase {

    var saveVoteUseCase: SaveVoteUseCase!
    var diContainer: AppDIContainer!
    
    override func setUpWithError() throws {
        diContainer = AppDIContainer()
        saveVoteUseCase = diContainer.makeSaveVoteUseCase()
    }

    override func tearDownWithError() throws {
        diContainer = nil
        saveVoteUseCase = nil
    }

    func testSaveVote() throws {
        //Given
        saveVoteUseCase.imageId = "abys"
        saveVoteUseCase.vote = .like
        //When
        saveVote { (result) in
            switch result {
                //Then
            case .success(let voteResponse):
                XCTAssertEqual(voteResponse.id, 1)
            case .failure(let error):
                XCTFail()
            }
        }
    }
    
    private func saveVote(completion: @escaping ((Response<VoteResponse>)-> Void)) {
        saveVoteUseCase.execute(completion: completion)
    }

}
