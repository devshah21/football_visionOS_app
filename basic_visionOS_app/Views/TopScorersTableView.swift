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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        TopScorersTableView(competition: .defaultCompetitions[1])
    }
    
}
