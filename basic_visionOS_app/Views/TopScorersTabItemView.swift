//
//  TopScorersTabItemView.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-14.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTabItemView: View {
    @State var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }.navigationTitle("XCA Scorers")
        } detail: {
            if let selectedCompetition {
                TopScorersTableView(competition: selectedCompetition)
                    .id(selectedCompetition)
            } else {
                Text("Select a competition")
            }
        }
    }
}

#Preview {
    TopScorersTabItemView()
}
