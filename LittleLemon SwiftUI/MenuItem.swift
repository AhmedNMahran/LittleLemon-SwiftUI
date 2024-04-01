//
//  MenuItem.swift
//  LittleLemon SwiftUI
//
//  Created by Ahmed Nabil on 31/03/2024.
//

import Foundation

struct MenuItem : Decodable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let category: String?
    let details: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case price
        case category
        case details = "description"
    }
}
