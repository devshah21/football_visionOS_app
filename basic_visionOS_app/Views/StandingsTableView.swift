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
    var vm = StandingTableObservable()
    
    
    
    var body: some View {
        Table(of: TeamStandingTable.self) {
            
            TableColumn("W") {Text($0.wonText)}
            
        } rows: {
            ForEach(vm.standings ?? []) {
                TableRow($0)
            }
        }
        .foregroundStyle(Color.primary)
            .navigationTitle(competition.name).task {
            await vm.fetchStandings(competition: competition)
        }
    }
}

#Preview {
    NavigationStack {
        StandingsTableView(competition:.defaultCompetitions[1])
    }
}
