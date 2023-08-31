//
//  HomeViewController.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 03.01.20.
//  Copyright © 2020 Tobias Steinbrück. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "Erinnerung"
                content.body = "Die Wein-Safari 2023 beginnt morgen!"
                content.categoryIdentifier = "alarm"
                content.sound = UNNotificationSound.default
                //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateFormatter.timeZone = TimeZone.current //(abbreviation: "GMT+0:00")
                let date = dateFormatter.date(from: "2023-09-15 11:30:00")

                let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

                let request = UNNotificationRequest(identifier: "WeinSafari2023", content: content, trigger: trigger)
                center.add(request)
                print("Erinnerung gesetzt.")
                
                /*let content2 = UNMutableNotificationContent()
                content2.title = "Erinnerung"
                content2.body = "Die Wein-Safari 2024 beginnt morgen!"
                content2.categoryIdentifier = "alarm"
                content2.sound = UNNotificationSound.default
                //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                let date2 = dateFormatter.date(from: "2024-09-13 11:30:00")

                let triggerDate2 = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date2!)
                let trigger2 = UNCalendarNotificationTrigger(dateMatching: triggerDate2, repeats: false)

                let request2 = UNNotificationRequest(identifier: "WeinSafari2024", content: content2, trigger: trigger2)
                center.add(request2)
                print("Erinnerung für naechstes Jahr gesetzt.")*/
            } else {
                print("Permission not granted.")
            }
        }
        super.viewDidLoad()
    }
}
