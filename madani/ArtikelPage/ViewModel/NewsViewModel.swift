//
//  NewsViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var article: NewsArticle
    
    init() {
        // Dummy data for demonstration
        self.article = NewsArticle(
            title: "Tumpukan Sampah Kotori Jalan Umban Sari",
            source: "sijoripost.com",
            timeAgo: "2 jam yang lalu",
            content: """
                Sejak adanya pengurangan biaya retribusi sampah sebesar Rp. 2000,-/RT, warga lebih memilih membuang sampahnya sendiri-sendiri ...
            """,
            imageUrl: "https://jatengprov.go.id/wp-content/uploads/2019/05/Ilustrasi-Pemukiman-Kumuh.jpg" // URL of the image
        )
    }
}
