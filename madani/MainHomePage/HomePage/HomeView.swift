//
//  HomeView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State var goToProfile = false
    @State private var isLongPressed = false
    
    @State private var suhuDanger = [Suhu]()
    
    @State var goToWasteManagement = false
    @State var goToDailyMission = false
    @State var goToMarketplace = false
    @State var goToEvent = false
    @State var goToDisaster = false
    
    @State var goToVoucher = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Profile and balance
                    HStack {
                        Image("profile_image")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .onTapGesture {
                                goToProfile = true
                            }
                        VStack(alignment: .leading) {
                            Text("Hello")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Maudy")
                                .font(.title)
                                .fontWeight(.bold)
                            
                        }
                        Spacer()
                        VStack {
                            Text("Saldo M-Point")
                            Text(": 30.000")
                        }.onTapGesture {
                            goToVoucher = true
                        }
                        VStack {
                            Text("Sampah terjual")
                            Text(": 0 kg")
                        }
                        // Profile Image
                        
                    }
                    .padding()
                    
                    
                    HStack {
                        VStack {
                            Image(systemName: "")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .padding()
                            
                            Text("Disaster Management")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .background(viewModel.itemsDanger.count > 0 ? .red : .blue)
                        .onTapGesture {
                            self.goToDisaster = true
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Grab")
                            Text("Polisi")
                            Text("Damkar")
                            Text("RT Setempat")
                        }
                        Image("SOS")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .onLongPressGesture {
                                print("SOS button long pressed")
                                isLongPressed = true
                            }
                    }.padding()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.items) { item in
                            VStack {
                                Image(systemName: item.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                                    .padding()
                                
                                Text(item.title)
                                    .font(.headline)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                if item.id == 1 {
                                    goToWasteManagement = true
                                }else if item.id == 2 {
                                    goToDailyMission = true
                                }else if item.id == 3 {
                                    goToMarketplace = true
                                }else {
                                    goToEvent = true
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                }
            }.background(
                NavigationLink(
                    destination: ProfileView(),
                    isActive: $goToProfile,
                    label: { EmptyView() }
                )
                .hidden()
            ).background(
                NavigationLink(
                    destination: WasteManagementView(),
                    isActive: $goToWasteManagement,
                    label: { EmptyView() }
                )
                .hidden())
            .background(
                NavigationLink(
                    destination: DailyMissionsView(),
                    isActive: $goToDailyMission,
                    label: { EmptyView() }
                )
                .hidden())
            .background(
                NavigationLink(
                    destination: TokoKaryaView(),
                    isActive: $goToMarketplace,
                    label: { EmptyView() }
                )
                .hidden())
            .background(
                NavigationLink(
                    destination: EventView(),
                    isActive: $goToEvent,
                    label: { EmptyView() }
                )
                .hidden())
            .background(
                NavigationLink(
                    destination: ZonaResikoView(viewModel: ZonaResikoViewModel(dangers: self.viewModel.itemsSuhu)),
                    isActive: $goToDisaster,
                    label: { EmptyView() }
                )
                .hidden())
            .background(
                NavigationLink(
                    destination: TukarPoinView(),
                    isActive: $goToVoucher,
                    label: { EmptyView() }
                )
                .hidden())
            .navigationTitle("Dashboard")
        }
    }
}

// Reusable components
struct ActionButton: View {
    let title: String
    let iconName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(title)
                .font(.system(size: 12))
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding([.top, .leading])
    }
}

struct ChallengeView: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(challenge.image).background(.red)
            Text(challenge.title)
                .font(.headline)
            Text(challenge.description)
                .font(.subheadline)
            Text("\(challenge.participants) participants")
                .font(.caption)
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct PromoItemView: View {
    let item: itemTokoKarya
    
    var body: some View {
        VStack {
            if let data = Data(base64Encoded: item.image ?? "", options: .ignoreUnknownCharacters), let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            Text(item.name ?? "")
                .font(.headline)
            Text(String(item.price ?? 0))
                .font(.subheadline)
            Text("Stock: \(item.stock ?? "")")
                .font(.caption)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
