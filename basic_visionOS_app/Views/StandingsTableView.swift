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
            
            TableColumn("Club") { team in
                HStack {
                    Text(team.positionText).fontWeight(.bold)
                        .frame(minWidth: 20)
                    
                    AsyncImage(url: URL(string:
                        team.team.crest ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                        default:
                            Circle().foregroundStyle(Color.gray.opacity(0.5))
                        }
                        
                    }
                        .frame(width: 40, height: 40)
                }
            }
            .width(min: 264)
            
            TableColumn("W") {Text($0.wonText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("D") {Text($0.drawText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("L") {Text($0.lostText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("GF") {Text($0.goalsForText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("GA") {Text($0.goalsAgainstText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("GD") {Text($0.goalDifferenceText).frame(minWidth: 40)}
                .width(40)
            
            TableColumn("Pts") {Text($0.pointsText).frame(minWidth: 40)}
                .width(40)
            
            
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
