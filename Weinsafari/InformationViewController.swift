//
//  InformationViewController.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 30.08.20.
//  Copyright © 2020 Tobias Steinbrück. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func facebookClicked(_ sender: Any) {
        openUrl(urlStr: "https://www.facebook.com/events/288678953027070")
    }
    
    @IBAction func instagramClicked(_ sender: Any) {
        openUrl(urlStr: "https://www.instagram.com/weinsafari_stgt/")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
