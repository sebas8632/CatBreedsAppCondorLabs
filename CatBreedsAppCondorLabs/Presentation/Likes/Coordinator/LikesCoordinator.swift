//
//  LikesCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import  UIKit
class LikesCoordinator: Coordinator {
    
    let navigationController: UINavigationController
     let diContainer: AppDIContainer
     
     init(navigationController: UINavigationController, diContainer: AppDIContainer) {
         self.navigationController = navigationController
         self.diContainer = diContainer
         
     }
    
    func start() {
        let likesViewControlleer = LikesViewController()
              likesViewControlleer.coordinator = self
        likesViewControlleer.likesViewModel = diContainer.makeLikesViewModel()
              navigationController.pushViewController(likesViewControlleer, animated: false)
    }
}
