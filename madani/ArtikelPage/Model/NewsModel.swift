//
//  NewsModel.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import Foundation

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let source: String
    let timeAgo: String
    let content: String
    let imageUrl: String
}
