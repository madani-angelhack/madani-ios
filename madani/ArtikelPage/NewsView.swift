//
//  ArtikelView.swift
//  madani
//
//  Created by fakhry_fauzan on 27/07/24.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let url = URL(string: viewModel.article.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .clipped()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.article.title)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Text(viewModel.article.source)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(viewModel.article.timeAgo)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(viewModel.article.content)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Berita")

        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
