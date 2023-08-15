//
//  TopScorersTableObservable.swift
//  basic_visionOS_app
//
//  Created by Dev Shah on 2023-08-14.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class TopScorersTableObservable {
    
    let client = FootballDataClient(apiKey: apiKey)
    var fetchPhase = FetchPhase<[Scorer]>.initial
    
    var scorers: [Scorer]? { fetchPhase.value }
}
