//
//  Category.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 29/11/2023.
//

import Foundation

struct Category {
    let id = UUID().uuidString
    let title: String
}

extension Category: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Category {
    static let devList: [Category] = [
        Category(title: "All Categories"),
        Category(title: "Sport"),
        Category(title: "Cima"),
        Category(title: "Cars"),
        Category(title: "Fashion"),
        Category(title: "Real State"),
        Category(title: "Food"),
        Category(title: "Toon"),
        Category(title: "Anything"),
    ]
}
