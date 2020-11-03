//
//  sandboxApp.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/02.
//

import SwiftUI

@main
struct sandboxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
