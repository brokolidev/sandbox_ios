//
//  AppDelegate.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/03.
//

import UIKit
import PusherSwift

class AppDelegate: NSObject, UIApplicationDelegate, PusherDelegate {
    
    var pusher: Pusher!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let options = PusherClientOptions(
            host: .cluster("ap3")
        )
        pusher = Pusher(
            key: "8d2a5785eaa2b859c699",
            options: options
        )
        pusher.delegate = self
        
        // subscribe to channel
        let channel = pusher.subscribe("my-channel")
        
        // bind a callback to handle an event
        let _ = channel.bind(eventName: "my-event", eventCallback: { (event: PusherEvent) in
            if let data = event.data {
                // you can parse the data as necessary
                print(data)
            }
        })
        
        pusher.connect()
        
        return true
    }
    
    // print Pusher debug messages
    func debugLog(message: String) {
        print(message)
    }
}
