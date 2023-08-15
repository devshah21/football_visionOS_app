//
//  TopScorersTableView.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-14.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTableView: View {
    
    let competition: Competition
    @Bindable var vm = TopScorersTableObservable()
    
    var body: some View {
        Table(of: Scorer.self) {
            TableColumn("Pos") { scorer in HStack {
                Text(scorer.posText).fontWeight(.bold).frame(minWidth: 20)
            }}.width(min: 264)
        } rows: {
            ForEach(vm.scorers ?? []) {
                TableRow($0)
            }
        }
            .navigationTitle(competition.name + " Top Scorers").task(id: vm.selectedFilter.id) {
            await vm.fetchTopScorers(competition: competition)
        }
    }
}

#Preview {
    NavigationStack {
        TopScorersTableView(competition: .defaultCompetitions[1])
    }
    
}
