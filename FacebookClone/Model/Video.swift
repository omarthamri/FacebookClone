//
//  Video.swift
//  FacebookClone
//
//  Created by omar thamri on 11/1/2024.
//

import Foundation

struct Video: Identifiable,Hashable,Codable {
    
    let id: String
    let videoUrl: String
    let videoDescription: String
}
