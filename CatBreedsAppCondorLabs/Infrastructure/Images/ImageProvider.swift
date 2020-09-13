//
//  ImageProvider.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ImageProvider {
    
    static func getImage(url: String, imageView: inout UIImageView, placeHolderName: String){
        let urlRequest = URL(string: url)
        imageView.kf.setImage(with: urlRequest, placeholder: UIImage(named: placeHolderName), options: nil, progressBlock: nil) { (result) in
            switch result {
            case .success(_):
                print("Image was loaded")
            case .failure(let error):
                print(ApplicationError.infraestructureError(descriptionError: error.localizedDescription))
            }
        }
    }
}
