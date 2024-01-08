//
//  RootView.swift
//  FacebookClone
//
//  Created by omar thamri on 8/1/2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
        var body: some View {
            Group {
                if viewModel.userSession != nil {
                    MainTabbarView()
                } else {
                    LoginView()
                }
            }
            
        }
}

#Preview {
    RootView()
}
