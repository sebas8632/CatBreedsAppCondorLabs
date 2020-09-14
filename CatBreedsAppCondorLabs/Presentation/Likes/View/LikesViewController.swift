//
//  LikesViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController {
    
    unowned var likesView: LikesView { return self.view as! LikesView }
    unowned var imageView : UIImageView { return likesView.imageView }
    unowned var unlikeImage : UIImageView { return likesView.unlikeImage }
    unowned var likeImage : UIImageView { return likesView.likeImage }
    
    var coordinator: LikesCoordinator?
    var likesViewModel: LikesViewModel?
    
    override func loadView() {
        self.view = LikesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Likes"
        likesViewModel?.delegate = self
        configTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getImages()

    }
    
    private func configTargets() {
        let tapUnlike = UITapGestureRecognizer(target: self, action: #selector(tapUnlikeAction))
        let taplike = UITapGestureRecognizer(target: self, action: #selector(tapLikeAction))
        
        unlikeImage.addGestureRecognizer(tapUnlike)
        likeImage.addGestureRecognizer(taplike)
    }
    
    @objc func tapUnlikeAction() {
        likesViewModel?.vote( vote: .unlike)
    }
    
    @objc func tapLikeAction() {
        likesViewModel?.vote( vote: .like)
    }
    
    private func getImages() {
        likesViewModel?.getImagesRandom()
    }
    
}

extension LikesViewController: LikesViewModelDelegate {
    func showImage(url: String) {
        let url = URL(string: url)
        
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: url)
        }
    }
}
