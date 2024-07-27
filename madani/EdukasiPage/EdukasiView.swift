import SwiftUI

struct EdukasiView: View {
    @State private var selectedTab: EdukasiTab = .artikel
    
    var body: some View {
        VStack {
            // Header
            VStack {
                Text("Ruang Edukasi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image("edukasi_banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .padding()
            }
            
            // Tab Bar
            HStack {
                tabItem(title: "Artikel", tab: .artikel)
                tabItem(title: "Berita", tab: .berita)
            }
            .padding(.vertical, 10)
            
            // Tab Content
            if selectedTab == .artikel {
                artikelList
            } else {
                beritaList
            }
        }
        .navigationTitle("Ruang Edukasi")
    }
    
    private var artikelList: some View {
        List {
            ArticleRowView(title: "LINGKUNGAN BERSIH CIPTAKAN HIDUP SEHAT", source: "dlh.bulelengkab.go.id", timeAgo: "1 jam yang lalu")
            ArticleRowView(title: "Membakar Sampah Bisa Membahayakan Tubuh", source: "kompas.com", timeAgo: "1 jam yang lalu")
            ArticleRowView(title: "Pentingnya Daur Ulang Sampah untuk Kesehatan", source: "sehats.com", timeAgo: "1 jam yang lalu")
            ArticleRowView(title: "Ubah Sampah jadi Emas", source: "antaranews.com", timeAgo: "2 jam yang lalu")
        }
        .listStyle(PlainListStyle())
    }
    
    private var beritaList: some View {
        List {
            ArticleRowView(title: "Berita 1", source: "sumber.com", timeAgo: "1 jam yang lalu")
            ArticleRowView(title: "Berita 2", source: "sumber.com", timeAgo: "2 jam yang lalu")
            ArticleRowView(title: "Berita 3", source: "sumber.com", timeAgo: "3 jam yang lalu")
        }
        .listStyle(PlainListStyle())
    }
    
    private func tabItem(title: String, tab: EdukasiTab) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(selectedTab == tab ? .black : .gray)
                Rectangle()
                    .fill(selectedTab == tab ? Color.black : Color.clear)
                    .frame(height: 2)
            }
            .padding(.horizontal)
        }
    }
}

struct ArticleRowView: View {
    let title: String
    let source: String
    let timeAgo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            Text("sumber: \(source)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(timeAgo)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
        .padding(.vertical, 8)
    }
}

struct EdukasiView_Previews: PreviewProvider {
    static var previews: some View {
        EdukasiView()
    }
}
