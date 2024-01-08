//
//  User.swift
//  FacebookClone
//
//  Created by omar thamri on 7/1/2024.
//

import Foundation
import Firebase

struct User: Identifiable,Hashable,Codable {
    
    let id: String
    var firstName: String
    var familyName: String
    var email: String
    var profileImageName: String?
    var coverImageName: String?
    var age: Int
    let gender: String
    var friendsIds: [String]
    var friendsRequestsIds: [String]
    var isCurrentUser: Bool {
            guard let currentUid = Auth.auth().currentUser?.uid else { return false }
            return id == currentUid
        }
}
