//
//  sandboxApp.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/02.
//

import SwiftUI
import PusherSwift

class AppDelegate: UIResponder, UIApplicationDelegate, PusherDelegate {
    
    var chat = Chat()
    
    // You must retain a strong reference to the Pusher instance
    var pusher: Pusher!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let options = PusherClientOptions(
            host: .cluster("ap3")
        )
        
        pusher = Pusher(
            key: "687d7dcfc9164dc16fad",
            options: options
        )
        
        pusher.delegate = self
        
        // subscribe to channel
        let channel = pusher.subscribe("orders")
        
        // bind a callback to handle an event
        let _ = channel.bind(eventName: "order.created", eventCallback: { (event: PusherEvent) in
            if let data = event.data {
                // you can parse the data as necessary
                self.chat.message = data
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


@main
struct sandboxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(self.appDelegate.chat)
        }
    }
}
