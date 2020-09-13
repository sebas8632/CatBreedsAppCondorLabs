//
//  HomeCoordinator.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let diContainer: AppDIContainer
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let homeTabBarViewController = HomeTabBarViewController()
        homeTabBarViewController.coordinator = self
        
        let breedsListNavigationController = UINavigationController()
        breedsListNavigationController.tabBarItem = UITabBarItem(title: "Breeds list", image: UIImage(named: "cat"), selectedImage: UIImage(named: "catFilled"))
       
        let breedListCoordinator = BreedsListCoordinator(navigationController: breedsListNavigationController, diContainer: diContainer)
        
        let likesNavigationController = UINavigationController()
        likesNavigationController.tabBarItem = UITabBarItem(title: "Likes", image: UIImage(named: "heart"), selectedImage: UIImage(named: "heartFilled"))
        
        let likesCoordinator = LikesCoordinator(navigationController: likesNavigationController, diContainer: diContainer)
       
        
        homeTabBarViewController.viewControllers = [breedsListNavigationController, likesNavigationController]
        
        homeTabBarViewController.modalPresentationStyle = .fullScreen
        navigationController.present(homeTabBarViewController, animated: false, completion: nil)
       
        coordinate(to: breedListCoordinator)
        coordinate(to: likesCoordinator)
        
    }
}
