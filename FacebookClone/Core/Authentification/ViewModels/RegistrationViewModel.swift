//
//  RegistrationViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    
    @MainActor
    func createUser() async throws {
        if let age = Int(age) {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: age, gender: gender)
        } else {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: 0, gender: gender)
        }
    }
    
    
}
