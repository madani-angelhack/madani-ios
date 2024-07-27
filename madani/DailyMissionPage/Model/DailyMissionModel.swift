//
//  DailyMissionModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

import Foundation

struct DailyMission: Identifiable {
    let id = UUID()
    let title: String
    let progress: Double
    let icon: String
}

struct ChallengeDaily: Identifiable {
    let id = UUID()
    let title: String
    let points: Int
    let participants: Int
    let icon: String
}

struct MonthlyTarget: Identifiable {
    let id = UUID()
    let title: String
    let progress: Double
    let goal: Double
    let icon: String
}
