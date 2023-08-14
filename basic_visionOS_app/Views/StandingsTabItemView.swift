//
//  StandingsTabItemView.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-14.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTabItemView: View {
    
    @State var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }.navigationTitle("XCA Standings")
        } detail: {
            if let selectedCompetition {
                StandingsTableView(competition: selectedCompetition).id(selectedCompetition)
            } else {
                Text("select a comp")
            }
            
        }
    }
}

#Preview {
    StandingsTabItemView()
}
