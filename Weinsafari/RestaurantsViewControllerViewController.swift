//
//  RestaurantsViewController.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 16.11.19.
//  Copyright © 2019 Tobias Steinbrück. All rights reserved.
//

import UIKit

class RestaurantsViewController: UITableViewController {
    
    let label = "label"
    let street = "street"
    let phone = "phone"
    let food = "food"
    let coordinates = "coordinates"

    let restaurants = [
        0: ["label":"Weingut Schwarz", "street": "Outback auf der Mönchbergspitze", "phone": "0711 334727", "food": "Weinausschank & Gebackenes auf die Hand", "coordinates": "48.780916,9.260507"],
        1: ["label":"Currle Lodge", "street": "Am Zuckerhäusle", "phone": "0151 23423927",
            "food": "Weinausschank & Flammkuchen", "coordinates": "48.782433,9.264464"],
        2: ["label":"Weinhof Zaiß", "street": "Württembergstraße 48 \n70327 Stuttgart Deutschland",
            "phone": "0711 331422", "food": "Weinausschank & Schnitzel", "coordinates": "48.783930,9.260940"],
        3: ["label":"MAXWEIN Camp", "street": "Am Mönchberg", "phone": "0173 8806615",
            "food": "Weinausschank & BBQ, Pulled Pork", "coordinates": "48.781127,9.258815"],
        4: ["label":"Weingut KD Warth", "street": "Württembergstraße 120 \n70327 Stuttgart Deutschland",
            "phone": "0711 3040550", "food": "Weinausschank & Grill, Wilde Kartoffel", "coordinates": "48.785445,9.265824"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    
    

    private func registerCell() {
        let cell = UINib(nibName: "RestaurantTableViewCell",
                         bundle: nil)
        self.tableView.register(cell,
                                forCellReuseIdentifier: "RestaurantCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantTableViewCell else {
            return UITableViewCell()
        }
        
        cell.restaurantLabel.text = restaurants[indexPath.row]![label]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SelectDetail", sender: indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectDetail" {
            let detailVC: RestaurantDetailViewController? = segue.destination as? RestaurantDetailViewController
            //let cell: UITableViewCell? = sender as? UITableViewCell
            let cell = sender as! Int
            
            if restaurants[cell] != nil && detailVC != nil {
                detailVC!.restaurantLabelText = restaurants[cell]![label]
                detailVC!.streetLabelText = restaurants[cell]![street]
                detailVC!.phoneText = restaurants[cell]![phone]
                detailVC!.foodText = restaurants[cell]![food]
                detailVC!.coordinates = restaurants[cell]![coordinates]
            }
        }
    }
}

