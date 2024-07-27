//
//  TukarPoinViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import Combine

class TukarPoinViewModel: ObservableObject {
    @Published var vouchers: [Voucher] = []
    @Published var saldoPoin: Int = 17000
    
    init() {
        loadVouchers()
    }
    
    private func loadVouchers() {
        // Mock data for vouchers
        vouchers = [
            Voucher(name: "Gratis Ongkir", points: 15000, validity: "berlaku hingga Januari 2024"),
            Voucher(name: "Potongan Harga", points: 25000, validity: "berlaku hingga Januari 2024"),
            Voucher(name: "Cashback", points: 20000, validity: "berlaku hingga Januari 2024")
        ]
    }
}
