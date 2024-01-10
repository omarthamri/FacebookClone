//
//  Post.swift
//  FacebookClone
//
//  Created by omar thamri on 7/1/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable,Hashable,Codable {
    
    let id: String
    let userId: String
    var postTitle: String
    var postUrl: String
    var postLikes: Int
    var postComments: Int
    var postShares: Int
    var isVideo: Bool
    let timestamp: Timestamp
    var user: User?
}
