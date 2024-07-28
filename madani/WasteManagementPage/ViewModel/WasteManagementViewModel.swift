//
//  WasteManagementViewModel.swift
//  madani
//
//  Created by fakhry_fauzan on 28/07/24.
//

import Foundation
import Combine

class WasteManagementViewModel: ObservableObject {
    @Published var items: [CatalogItem] = []
    @Published var categories: [WasteCategory] = []
    @Published var selectedCategory = "Umum"
    private var cancellables = Set<AnyCancellable>()
    
    var filteredItems: [CatalogItem] {
        items.filter { $0.wasteCategory == selectedCategory }
    }
    
    init() {
        // Initialize with sample data
        loadSampleData()
    }
    
    func loadSampleData() {
        if let url = URL(string: "https://personal-j15xifdf.outsystemscloud.com/ServiceWasteManagement/rest/WasteManagement/GetAllWasteManagement") {
            NetworkHelper.shared.fetchData(from: url, type: [CatalogItem].self).sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] dataModels in
                self?.items = dataModels
            })
            .store(in: &cancellables)
        }
        if let url = URL(string: "https://personal-j15xifdf.outsystemscloud.com/ServiceWasteManagement/rest/WasteManagement/GetWasteCategory") {
            NetworkHelper.shared.fetchData(from: url, type: [WMCategory].self).sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] dataModels in
                self?.categories = dataModels.map({ wm in
                    WasteCategory(id: wm.wasteCategory.id, label: wm.wasteCategory.label, order: wm.wasteCategory.order, isActive: wm.wasteCategory.isActive)
                })
            })
            .store(in: &cancellables)
        }
    
    }
}
