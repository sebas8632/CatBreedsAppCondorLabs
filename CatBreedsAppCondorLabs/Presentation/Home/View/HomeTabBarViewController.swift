//
//  HomeTabBarViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {

    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tabBarConfig()
        // Do any additional setup after loading the view.
    }
    
    private func tabBarConfig() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .default
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.orange
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }
}
