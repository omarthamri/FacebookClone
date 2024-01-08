//
//  LoginViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
    
}
