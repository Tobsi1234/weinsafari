//
//  RestaurantDetailViewController.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 16.11.19.
//  Copyright © 2019 Tobias Steinbrück. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    var restaurantLabelText: String?
    var streetLabelText: String?
    var phoneText: String?
    var foodText: String?
    var coordinates: String?
    var textText: String?

    @IBOutlet var restaurantLabel: UILabel!
    @IBOutlet var streetButton: UIButton!
    @IBOutlet var phone: UITextView!
    @IBOutlet var food: UILabel!
    @IBOutlet var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phone.isEditable = false;
        phone.dataDetectorTypes = UIDataDetectorTypes.all;
        
        NSLog(coordinates!)
        
        if restaurantLabelText != nil {
            self.restaurantLabel.text = restaurantLabelText
            //self.restaurantLabel.textAlignment = .center
        }
        if streetLabelText != nil {
            self.streetButton.setTitle(streetLabelText, for: .normal)
            self.streetButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        }
        if phoneText != nil {
            self.phone.text = phoneText
        }
        if foodText != nil {
            self.food.text = foodText
        }
        if textText != nil {
            self.text.text = textText
        }
    }

    @IBAction func openMaps(_ sender: Any) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if (UIApplication.shared.canOpenURL(URL(string:"http://maps.apple.com")!)) {
            alert.addAction(UIAlertAction(title: "Apple Karten", style: .default) { _ in
                let appleUrl = "http://maps.apple.com?q=\(self.coordinates!)&z=10"
                UIApplication.shared.open(URL(string: appleUrl)!, options: [:],completionHandler: {
                    (success) in
                       print("Open Apple")
                })
            })
        } else {
           NSLog("Can't use http://maps.apple.com");
        }

        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            alert.addAction(UIAlertAction(title: "Google Maps", style: .default) { _ in
                let googleUrl = "comgooglemaps://?q=\(self.coordinates!)&zoom=10&views=traffic"
                UIApplication.shared.open(URL(string: googleUrl)!, options: [:],completionHandler: {
                    (success) in
                       print("Open Google")
                })
            })
        } else {
           NSLog("Can't use comgooglemaps://");
        }
        
        alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        })

        present(alert, animated: true)
    }
}
