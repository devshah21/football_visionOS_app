//
//  StandingsTableView.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-05.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableView: View {
    
    let competition: Competition
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).navigationTitle(competition.name)
    }
}

#Preview {
    NavigationStack {
        StandingsTableView(competition:.defaultCompetitions[1])
    }
}
