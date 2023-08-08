//
//  StandingTableObservable.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-07.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class StandingTableObservable {
    
    let client = FootballDataClient(apiKey: apiKey)
    
    var fetchPhase = FetchPhase<[TeamStandingTable]>.initial
    
    var standings: [TeamStandingTable]? {fetchPhase.value}
    
    func fetchStandings(competition: Competition) async {
        fetchPhase = .fetching
        do {
            let standings = try await client.fetchStandings(competitionId: competition.id)
            if Task.isCancelled { return }
            fetchPhase = .success(standings)
        } catch {
            fetchPhase = .failure(error)
        }
    }
    
}
