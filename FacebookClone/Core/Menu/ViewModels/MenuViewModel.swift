//
//  MenuViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    @MainActor
    func logout() {
        AuthService.shared.signout()
    }
    
}
