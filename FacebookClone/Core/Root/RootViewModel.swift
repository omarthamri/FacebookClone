//
//  RootView.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import SwiftUI
import Combine
import Firebase

class RootViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    func setupSubscribers() {
        AuthService.shared.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
