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
                content.body = "Die Wein-Safari 2022 beginnt morgen!"
                content.categoryIdentifier = "alarm"
                content.sound = UNNotificationSound.default
                //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateFormatter.timeZone = TimeZone.current //(abbreviation: "GMT+0:00")
                let date = dateFormatter.date(from: "2022-09-16 11:30:00")

                let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                //let date1 = Date()
                //print(date1)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
                print("Erinnerung gesetzt.")
            } else {
                print("Permission not granted.")
            }
        }
        super.viewDidLoad()
    }
}
