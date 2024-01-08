//
//  UserService.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class UserService {
    
    @Published var currentUser: User?
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({ $0.id  != currentUid })
    }
    
    func reset() {
        self.currentUser = nil
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
