//
//  basic_visionOS_appApp.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-05.
//

import SwiftUI
let apiKey = ""

@main
struct basic_visionOS_appApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                StandingsTabItemView().tabItem { Label("Standings", systemImage: "table.fill")}
                
                
                Text("Top Scorers").tabItem { Label("Top Scorers", systemImage: "soccerball.inverse")}
            }
        }
    }
}
