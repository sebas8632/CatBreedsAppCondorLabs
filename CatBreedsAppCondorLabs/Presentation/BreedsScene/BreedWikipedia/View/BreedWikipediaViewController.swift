//
//  BreedWikipediaViewController.swift
//  CatBreedsAppCondorLabs
//
//  Created by Juan Florez on 13/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import UIKit
import WebKit
class BreedWikipediaViewController: UIViewController {

    unowned var breedWikipedia: BreedWikipediaView { return self.view as! BreedWikipediaView }
    unowned var webView: WKWebView { return breedWikipedia.webView }
    var coordinator: BreedWikipediaCoordinator?
    
    var urlWikipedia: String?
    
    override func loadView() {
        self.view = BreedWikipediaView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wikipedia"
        guard let urlWiki = self.urlWikipedia else {self.manageError(error: ApplicationError.appError); return}
        let url = URL(string: urlWiki)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        hideLoading()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
