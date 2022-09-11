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
    let color = "color"
    let text = "text"

    let restaurants = [
        4: ["label":"Weingut Schwarz", "street": "Outback auf der Mönchbergspitze", "phone": "0711 334727", "food": "Weinausschank & Gebackenes auf die Hand", "coordinates": "48.780916,9.260507", "color": UIColor.systemYellow,
            "text": "Über 300 Jahre zieht sich die Weinbautradition bereits wie ein roter Faden durch die Reihen der Familie Schwarz. Mit Ludwig und Stefanie ist mittlerweile auch die nächste und damit 9. Generation im Betrieb.\nWir betreiben ein Familienweingut mit dazugehöriger Besenwirtschaft im Stuttgarter Stadtteil Untertürkheim. Vermarktet werden Weine von 11 Hektar Rebfläche. Hierbei liegt der Fokus auf den roten Rebsorten - Lemberger als Flaggschiff, gefolgt von Spätburgunder, Merlot und dem gebietstypischen Trollinger. Bei den weißen Sorten steht der Riesling an der Spitze der Anbaufläche, wichtig sind für uns aber auch Grauburgunder, Weißburgunder und Chardonnay.\n\nBodenständig, heimatverbunden und modern sind wir – so auch unsere Weine."],
        2: ["label":"Currle Lodge", "street": "Am Zuckerhäusle", "phone": "0151 23423927",
            "food": "Weinausschank & Flammkuchen", "coordinates": "48.782433,9.264464", "color": UIColor.systemRed,
            "text": "Das WEINGUT CURRLE liegt am Fuße der Weinberge im malerischen Weinort Stuttgart Uhlbach. Die Grabkapelle auf dem Württemberg in Rotenberg und das Weinbaumuseum in Uhlbach bieten attraktive Ausflugsmöglichkeiten. Der Stuttgarter Weinwanderweg führt direkt bei uns am Weingut vorbei. Gekocht wird schwäbisch regional mit vielen Spezialitäten. Dazu gehören beispielsweise geschmorte Schweinebäckle, Sülze vom Tafelspitz und Maultaschen mit Kartoffelsalat - all das, was Beswenwirtschaft Gäste mögen. Des Weiteren servieren wir immer Linsen und Spätzle, Gerichte mit Sauerkraut und knusprige Bratkartoffeln. Am Nachmittag gibt es hausgebackene Kuchen und warmer Ofenschlupfer mit Kaffeespezialitäten. Traditionell gibt es Viertele vom Riesling, Trollinger und Schillerwein, sowie erlesene Flaschenweine. Alle Weine und Sekte stammen aus eigener Erzeugung von unserem Weingut Currle."],
        0: ["label":"Weinhof Zaiß", "street": "Württembergstraße 48 \n70327 Stuttgart Deutschland",
            "phone": "0711 331422", "food": "Weinausschank & Schnitzel, Spareribs", "coordinates": "48.783930,9.260940", "color": UIColor.systemIndigo,
            "text": "Seit 1646, mit unserem Stammvater Johann Mauritio Zaiß, sind wir in Untertürkheim ansässig.\nAm Weinhof am Württemberg wird der Wein gekeltert, ausgebaut und ausgeschenkt. Der Anbau der Trauben erfolgt mit erfahrenem Auge und viel Handarbeit. Das heißt, dass von Anfang an sehr gefühlvoll darauf geachtet wird, was der Wein braucht, um sich voll entfalten zu können. \n\nGemäß dem Motto: Immer mit der Natur - nie dagegen!"],
        3: ["label":"MAXWEIN Camp", "street": "Am Mönchberg", "phone": "0173 8806615",
            "food": "Weinausschank & BBQ, Pulled Pork", "coordinates": "48.781127,9.258815", "color": UIColor.systemTeal,
            "text": "Groß geworden mit den Weinbergen meines Großvaters erkannte ich früh, dass ich diese Leidenschaft zum Beruf machen werde. Dabei hatte ich stets das Ziel vor Augen, meine eigenen Weine herzustellen. Nachdem ich meine Ausbildung zum Winzer erfolgreich abgeschlossen hatte, sammelte ich in verschiedenen Betrieben Berufserfahrung. Anschließend absolvierte ich die Weiterbildung zum \"Staatlich geprüften Techniker für Weinbau und Oenologie\". Seit 2017 bewirtschafte ich meine ersten eigenen Weinberge in Stuttgart-Obertürkheim. Mit meinen ersten Weinen möchte ich als aufstrebender Jungwinzer den traditionellen Stuttgarter Weinkessel aufmischen. Unsere Rebfläche hat sich im ersten Jahr vervierfacht und unser Weinsortiment hat sich dadurch vergrößert. Neben unserem Premium Riesling „Hand und Fuß“ bringt der neue Jahrgang 2018 Weine wie Müller-Thurgau und Lemberger mit sich. Auch neu in unserem Keller ist ein Muskattrollinger- Rosé und ein Weißwein gekeltert aus roten Trauben. Für alle die etwas Spritzig und Fruchtiges mögen, sind unsere zwei Secco´s neu dabei."],
        1: ["label":"Weingut KD Warth", "street": "Württembergstraße 120 \n70327 Stuttgart Deutschland",
            "phone": "0711 3040550", "food": "Weinausschank & Grill, Wilde Kartoffel", "coordinates": "48.785445,9.265824", "color": UIColor.systemOrange,
            "text": "Anno 1657 pflanzt Bartholomäus Warth in Untertürkheim seine ersten Weinreben. Auf den damit gelegten Grundstein für den erfolgreichen Weinbau der Familie Warth wurde in den folgenden 350 Jahren erfolgreich aufgebaut. Heute, 10 Generationen später, blicken wir auf zahlreiche Persönlichkeiten zurück, die vielfach dem König als Weingartmeister gedient haben, und in späteren Zeiten mehrfach den Bürgermeister von Untertürkheim stellten. \nMit dem Jahrgang 2008 beginnen wir unsere Weine selbst auszubauen. Und dies mit einem besonderen Versprechen: Die im Weinberg erzeugte Traubenqualität mit sanften Methoden so naturgetreu wie möglich in Weinflaschen zu füllen. \nDer Dank dafür gilt Ihnen, dass sie mit mir die Leidenschaft für hochwertige trockene Weine teilen. \nIch wünsche Ihnen viel Freude bei einem Besuch bei uns.\nIhr Klaus-Dieter Warth"]
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
        
        cell.restaurantLabel.text = restaurants[indexPath.row]![label] as? String
        cell.contentView.backgroundColor = restaurants[indexPath.row]![color] as? UIColor
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
                detailVC!.restaurantLabelText = restaurants[cell]![label] as? String
                detailVC!.streetLabelText = restaurants[cell]![street] as? String
                detailVC!.phoneText = restaurants[cell]![phone] as? String
                detailVC!.foodText = restaurants[cell]![food] as? String
                detailVC!.coordinates = restaurants[cell]![coordinates] as? String
                detailVC!.textText = restaurants[cell]![text] as? String
            }
        }
    }
    
}

