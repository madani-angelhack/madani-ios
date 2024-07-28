//
//  DailyMissionViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Combine

class MissionsViewModel: ObservableObject {
    @Published var dailyMissions: [DailyMission]
    @Published var challenges: [ChallengeDaily]
    @Published var monthlyTargets: [MonthlyTarget]
    
    init() {
        // Dummy data for demonstration
        self.dailyMissions = [
            DailyMission(title: "Jual 5 kg Botol Plastik", progress: 0.4, icon: "icon_bottle"),
            DailyMission(title: "Baca 5 Artikel", progress: 0.8, icon: "icon_article")
        ]
        
        self.challenges = [
            ChallengeDaily(title: "Jual 5 kg Sampah", points: 500, participants: 123, icon: "icon_challenge1"),
            ChallengeDaily(title: "Melakukan Recycle", points: 300, participants: 89, icon: "icon_challenge2")
        ]
        
        self.monthlyTargets = [
            MonthlyTarget(title: "Menjual 100kg Sampah", progress: 60, goal: 100, icon: "icon_target1"),
            MonthlyTarget(title: "Menjual 100kg Sampah", progress: 80, goal: 100, icon: "icon_target2")
        ]
    }
}
