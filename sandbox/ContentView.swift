//
//  ContentView.swift
//  sandbox
//
//  Created by Hyunseung Choi on 2020/11/02.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("test")
        
        Button(action: {
            print("Test")
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
