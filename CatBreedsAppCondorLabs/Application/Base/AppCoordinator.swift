//
//  AppCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let diContainer: AppDIContainer = AppDIContainer()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, diContainer: diContainer)
        coordinate(to: homeCoordinator)
    }
}
