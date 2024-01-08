//
//  MarketPlaceViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation
import Observation


@Observable
class MarketPlaceViewModel {
    
    var items: [Item] = [
        Item(id: UUID().uuidString, item_name: "1 bed 1 bathroom", item_price: 950, imageName: "apartment1"),
        Item(id: UUID().uuidString, item_name: "1 bed 1 bath flat", item_price: 800, imageName: "apartment2"),
        Item(id: UUID().uuidString, item_name: "2015 BMW", item_price: 2600, imageName: "car1"),
        Item(id: UUID().uuidString, item_name: "2020 Mercedes", item_price: 44, imageName: "car2"),
        Item(id: UUID().uuidString, item_name: "corner sofa", item_price: 80, imageName: "sofa1"),
        Item(id: UUID().uuidString, item_name: "corner sofa", item_price: 86, imageName: "sofa2")
    ]
    
    
}
