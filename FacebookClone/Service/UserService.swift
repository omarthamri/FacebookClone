//
//  UserService.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift


class UserService {
    
    @Published var currentUser: User?
    @Published var users: [User]?
    @Published var friends: [User]?
    @Published var friendsRequests: [User]?
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
        try await fetchFriends()
        try await fetchFriendRequests()
    }
    
    @MainActor
    func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({ $0.id  != currentUid })
    }
    
    @MainActor
    func fetchFriends() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        guard let friendsIds = self.currentUser?.friendsIds else { return }
        self.friends = users.filter({ friendsIds.contains($0.id) })
    }
    
    @MainActor
    func fetchFriendRequests() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        guard let friendsRequestsIds = self.currentUser?.friendsRequestsIds else { return }
        self.friendsRequests = users.filter({ friendsRequestsIds.contains($0.id) })
    }
    
    func reset() {
        self.currentUser = nil
        self.friends = nil
        self.friendsRequests = nil
    }
    
    static func fetchUser(withuid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageName": imageUrl
        ])
        self.currentUser?.profileImageName = imageUrl
    }
    
    @MainActor
    func updateUserCoverImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "coverImageName": imageUrl
        ])
        self.currentUser?.coverImageName = imageUrl
    }
}
