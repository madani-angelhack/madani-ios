//
//  TukarPoinViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI
import Combine

class TukarPoinViewModel: ObservableObject {
//    @Published var vouchers: [Voucher] = []
    @Published var saldoPoin: Int = 17000
    
    @Published var vouchers: [Voucher] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadVouchers()
    }
    
    private func loadVouchers() {
        
        if let url = URL(string: "https://personal-j15xifdf.outsystemscloud.com/ServicePoint/rest/Point/GetVoucher")?.withQueries(["id":"13"]) {
            NetworkHelper.shared.fetchData(from: url, type: [Voucher].self).sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] dataModels in
                self?.vouchers = dataModels
            })
            .store(in: &cancellables)
        }
        // Mock data for vouchers
    }
}
