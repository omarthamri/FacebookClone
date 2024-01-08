//
//  MainTabbarView.swift
//  FacebookClone
//
//  Created by omar thamri on 29/12/2023.
//

import SwiftUI

struct MainTabbarView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                                    VStack {
                                        Image(systemName: "house")
                                            .environment(\.symbolVariants,selectedTab == 0 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 0
                                }
            VideosView()
                .tabItem {
                                    VStack {
                                        Image(systemName: "play.tv")
                                            .environment(\.symbolVariants,selectedTab == 1 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 1
                                }
            
            FriendsView()
                .tabItem {
                                    VStack {
                                        Image(systemName: "person.2")
                                            .environment(\.symbolVariants,selectedTab == 2 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 2
                                }
            MarketplaceView()
                .tabItem {
                                    VStack {
                                        Image("marketplace")
                                            .environment(\.symbolVariants,selectedTab == 3 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 3
                                }
            MenuView()
                .tabItem {
                                    VStack {
                                        Image(systemName: "text.justify")
                                            .environment(\.symbolVariants,selectedTab == 5 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 5
                                }
            
            
        }
        .onAppear{
            UITabBar.appearance().barTintColor = .white
        }

    }
        }

#Preview {
    MainTabbarView()
}
