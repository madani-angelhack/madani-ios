//
//  TukarPoinView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct TukarPoinView: View {
    @StateObject private var viewModel = TukarPoinViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Saldo M-Point
                    HStack {
                        Button(action: {
                            // Action for voucher button
                        }) {
                            Image(systemName: "ticket.fill")
                            VStack {
                                
                                Text("Saldo M-Point")
                                
                                Text("\(viewModel.saldoPoin)")
                            }
                            
                        }.padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .frame(width: 200, height: 100)
    //                   Spacer()
                        Button(action: {
                            // Action for voucher button
                        }) {
                            VStack {
                                HStack {
                                    Image(systemName: "ticket.fill")
                                    Text("Voucher")
                                }
                                Text("")
                            }
                           
                            
                        }.padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .frame(width: 150, height: 100)
                    }
                    .padding()
                    
                    // Voucher Tersedia
                    SectionHeaderView(title: "Voucher Tersedia")
                    ForEach(viewModel.vouchers) { voucher in
                        VoucherView(voucher: voucher)
                    }
                    .padding(.horizontal)
                    
                    // Top-Up Section
                    SectionHeaderView(title: "Top-Up")
                    VStack {
                        TopUpButton(title: "Pulsa", iconName: "phone.fill")
                        TopUpButton(title: "Gopay", iconName: "creditcard.fill")
                        TopUpButton(title: "E-Wallet", iconName: "wallet.pass.fill")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }.navigationTitle("Tukar Poin")
    }
}

// Reusable components
struct VoucherView: View {
    let voucher: Voucher
    
    var body: some View {
        HStack {
            Image(systemName: "ticket.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
            VStack(alignment: .leading) {
                Text(voucher.name)
                    .font(.headline)
                Text(voucher.validity)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(voucher.points) Poin")
                .font(.headline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.vertical, 5)
    }
}

struct TopUpButton: View {
    let title: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

//struct SectionHeaderView: View {
//    let title: String
//
//    var body: some View {
//        Text(title)
//            .font(.title2)
//            .fontWeight(.bold)
//            .padding(.vertical, 10)
//    }
//}

struct TukarPoinView_Previews: PreviewProvider {
    static var previews: some View {
        TukarPoinView()
            .previewDevice("iPhone 12")
    }
}
