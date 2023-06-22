//
//  First_VisionOS_appApp.swift
//  First VisionOS app
//
//  Created by Nethan on 22/6/23.
//

import SwiftUI

@main
struct First_VisionOS_appApp: App {
    var body: some Scene {
        WindowGroup(id: "Content") {
            ContentView()
        }
        
        WindowGroup(id: "Second") {
            SecondView()
        }
        
        ImmersiveSpace(id: "sphere") {
            SphereView()
        }
       
    }
}
