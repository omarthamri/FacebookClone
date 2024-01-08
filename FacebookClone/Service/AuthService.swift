//
//  AuthService.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService: ObservableObject {
    
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String,password: String,firstName: String,familyName: String,age: Int,gender: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, id: result.user.uid)
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(email: String,password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(firstName: String,familyName: String,email: String,age: Int,gender: String, id: String) async throws {
        let user = User(id: id, firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, friendsIds: [], friendsRequestsIds: [])
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
        
    }
    
}
