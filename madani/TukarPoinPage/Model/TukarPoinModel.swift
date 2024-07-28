//
//  TukarPoinModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

struct Voucher: Codable, Identifiable {
    var id: String?
    
    let voucherType: String?
    let amount: Int?
    let date: String?
    let nom: Int?

    enum CodingKeys: String, CodingKey {
        case voucherType = "VoucherType"
        case amount = "Amount"
        case date
        case nom = "Nom"
    }
}
