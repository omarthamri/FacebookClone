//
//  Item.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation

struct Item: Identifiable,Hashable,Codable {
    
    let id: String
    var item_name: String
    var item_price: Int
    var imageName: String
}
