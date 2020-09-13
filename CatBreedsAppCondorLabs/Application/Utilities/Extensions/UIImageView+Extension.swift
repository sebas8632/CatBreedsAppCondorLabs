//
//  UIImageView+Extension.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func getImageFrom(url: String, placeholderName: String) {
        var imageView = self
        ImageProvider.getImage(url: url, imageView: &imageView, placeHolderName: placeholderName)
        self.image = imageView.image
    }
}
