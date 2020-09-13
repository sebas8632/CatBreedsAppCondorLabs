//
//  UIViewController+Extension.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import UIKit
import Foundation
fileprivate var containerLoading: UIView?

//MARK: - Show loading indicator
extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        containerLoading?.backgroundColor = .none
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading!.center
        activityIndicator.startAnimating()
        containerLoading?.addSubview(activityIndicator)
        self.view.addSubview(containerLoading!)
    }
    
    func hideLoading () {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
    
    
}

//MARK: Add cornerRadius for whatever View
extension UIView {
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 5
        self.layer.masksToBounds = true
    }
}


extension UIViewController: ErrorManagerProtocol {
    
    
    func manageError(error: ApplicationError) {
        errorManager(error: error)
    }
    
    
    private func errorManager(error: ApplicationError) {
        DispatchQueue.main.async {
            self.hideLoading()
            let alert = UIAlertController(title: error.localizedDescription, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}


