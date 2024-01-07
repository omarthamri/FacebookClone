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
            ContentView()
                .tabItem {
                                    VStack {
                                        Image(systemName: "house")
                                            .environment(\.symbolVariants,selectedTab == 0 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 0
                                }
            Text("2")
                .tabItem {
                                    VStack {
                                        Image(systemName: "play.tv")
                                            .environment(\.symbolVariants,selectedTab == 1 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 1
                                }
            
            Text("3")
                .tabItem {
                                    VStack {
                                        Image(systemName: "person.2")
                                            .environment(\.symbolVariants,selectedTab == 2 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 2
                                }
            Text("4")
                .tabItem {
                                    VStack {
                                        Image("marketplace")
                                            .environment(\.symbolVariants,selectedTab == 3 ? .fill : .none)
                                    }
                                }
                                .onAppear{
                                    selectedTab = 3
                                }
            Text("6")
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
