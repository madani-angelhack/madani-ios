//
//  DailyMissionView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct DailyMissionsView: View {
    @ObservedObject var viewModel = MissionsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack {
                    Text("Misi Harian")
                        .font(.title)
                        .bold()
                    
                    Image("misi_harian_header") // Replace with actual image name
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                        .padding()
                    
                    Text("Selesaikan Misi Dapatkan Poin")
                        .font(.headline)
                        .padding(.top, 10)
                }
                .padding()
//                .background(Color.orange)
                .cornerRadius(10)
                
                // Daily Missions
                VStack(alignment: .leading, spacing: 10) {
                    Text("Misi Harianku")
                        .font(.headline)
                        .padding(.leading, 10)
                    
                    ForEach(viewModel.dailyMissions) { mission in
                        HStack {
                            Image(mission.icon) // Replace with actual icon name
                                .resizable()
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading) {
                                Text(mission.title)
                                    .font(.body)
                                ProgressView(value: mission.progress)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .frame(height: 10)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
                
                // Available Challenges
                VStack(alignment: .leading, spacing: 10) {
                    Text("Challenge Tersedia")
                        .font(.headline)
                        .padding(.leading, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.challenges) { challenge in
                                VStack {
                                    Image(challenge.icon) // Replace with actual icon name
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    
                                    Text(challenge.title)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("\(challenge.points) Poin")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(challenge.participants) partisipan")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                
                // Monthly Targets
                VStack(alignment: .leading, spacing: 10) {
                    Text("Target Bulanan")
                        .font(.headline)
                        .padding(.leading, 10)
                    
                    ForEach(viewModel.monthlyTargets) { target in
                        HStack {
                            Image(target.icon) // Replace with actual icon name
                                .resizable()
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading) {
                                Text(target.title)
                                    .font(.body)
                                ProgressView(value: target.progress / target.goal)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .frame(height: 10)
                                
                                HStack {
                                    Text("\(Int(target.progress))kg")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("\(Int(target.goal))kg")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Halaman Misi Harian")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DailyMissionsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyMissionsView()
    }
}
