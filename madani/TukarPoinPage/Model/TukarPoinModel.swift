//
//  TukarPoinModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation


struct Voucher: Identifiable, Codable {
    let id = UUID()
    let name: String
    let points: Int
    let validity: String
}
