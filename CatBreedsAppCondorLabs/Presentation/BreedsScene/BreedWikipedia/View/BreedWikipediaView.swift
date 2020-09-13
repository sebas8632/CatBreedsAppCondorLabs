//
//  BreedWikipediaView.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import UIKit
import WebKit

class BreedWikipediaView: UIView {

        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewConfig()
        constraintConfig()
    }

    
    private func viewConfig() {
        self.backgroundColor = .white
        self.addSubview(webView)
    }
    
    private func constraintConfig() {
        webViewConstraint()
    }
    
    //MARK: Constraints
    
    private func webViewConstraint() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    //MARK: Components
    
    lazy var webView: WKWebView = {
        
        let webView = WKWebView()
        
        return webView
    }()
}
