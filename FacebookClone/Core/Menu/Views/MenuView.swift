//
//  OthersView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    
                        VStack(alignment: .leading) {
                            HeaderMenuView()
                            ShortCutListView(width: proxy.size.width)
                            MenuListView(width: proxy.size.width - 30)
                            Spacer()
                                .frame(height: 10)
                            }
                        
                        }
                }
                .scrollIndicators(.hidden)
                .background(Color(.systemGray6))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                       Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "gearshape.fill")
                            Image(systemName: "magnifyingglass")
                                
                        }
                        .fontWeight(.bold)
                        
                    }
            }
        }
    }
}

#Preview {
    MenuView()
}

struct MenuListView: View {
    private var width: CGFloat
    @State private var showLogoutAlert: Bool = false
    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        VStack {
            MenuCell(title: "Help & support", imageName: "questionmark.circle.fill")
            MenuCell(title: "Settings & privacy", imageName: "gearshape.fill")
            MenuCell(title: "Also from Meta", imageName: "window.casement.closed")
            Button(action: {
                showLogoutAlert.toggle()
            }, label: {
                Text("Log Out")
                    .font(.headline)
                    .frame(width: width, height: 44)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.black)
                    .padding()
            })
        }
        .alert("Log out of your account?", isPresented: $showLogoutAlert, actions: {
                            Button("Logout") { }
                            Button("Cancel", role: .cancel) {}
                        })
    }
}
