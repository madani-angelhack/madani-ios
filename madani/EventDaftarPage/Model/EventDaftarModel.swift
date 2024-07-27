

import Foundation

struct EventDaftarModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let address: String
    let date: String
    let time: String
    let imageUrl: String
    let mapImageUrl: String
}
