//
//  Celebrity.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

import UIKit

struct Celebrity {
    let id = UUID().uuidString
    let name: String
    let jobTitle: String
    let image: UIImage
    let isFollowed: Bool
}

extension Celebrity: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Celebrity {
    static let devList: [Celebrity] = [
        Celebrity(name: "Amr Salama", jobTitle: "Film Director", image: .amr, isFollowed: false),
        Celebrity(name: "Ben Affleck", jobTitle: "American Actor", image: .ben, isFollowed: true),
        Celebrity(name: "Ana de Armas", jobTitle: "Spanish Actress", image: .ana, isFollowed: false),
        Celebrity(name: "Amr Salama", jobTitle: "Film Director", image: .amr, isFollowed: false)
    ]
}
