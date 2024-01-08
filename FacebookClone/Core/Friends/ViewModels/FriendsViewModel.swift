//
//  FriendsViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 7/1/2024.
//

import Foundation
import Observation

@Observable
class FriendsViewModel {
    var users: [User] = [
        User(id: "0", firstName: "Omar", familyName: "Thamri", email: "omar.thamri@gmail.com", profileImageName: "profilePic", coverImageName: "cover_picture", age: 28, gender: "male", friendsIds: ["1","2","3","4"], friendsRequestsIds: ["5","6","7"]),
       User(id: "1", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", coverImageName: "Story1", age: 42, gender: "male", friendsIds: [], friendsRequestsIds: []),
       User(id: "2", firstName: "Wanda", familyName: "Maximov", email: "wanda.maximov@gmail.com", profileImageName: "profilePic2", coverImageName: "Story2", age: 34, gender: "female", friendsIds: [], friendsRequestsIds: []),
       User(id: "3", firstName: "Thomas", familyName: "Shelby", email: "thomas.shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "Story3", age: 44, gender: "male", friendsIds: [], friendsRequestsIds: []),
        User(id: "4", firstName: "Nancy", familyName: "Wheeler", email: "nancy.wheeler@gmail.com", profileImageName: "profilePic4", coverImageName: "Story4", age: 27, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "5", firstName: "Pam", familyName: "Beesley", email: "pam.beesley@gmail.com", profileImageName: "pam", coverImageName: "Story4", age: 43, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "6", firstName: "Dwight", familyName: "Schrute", email: "dwight.schrute@gmail.com", profileImageName: "dwight", coverImageName: "Story4", age: 50, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "7", firstName: "Natasha", familyName: "Romanov", email: "natasha.romanov@gmail.com", profileImageName: "romanoff", coverImageName: "Story4", age: 38, gender: "female", friendsIds: [], friendsRequestsIds: [])
    ]
}

