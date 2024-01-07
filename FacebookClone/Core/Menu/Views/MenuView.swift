//
//  OthersView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                    VStack {
                        HeaderMenuView()
                        Spacer()
                        Divider()
                    }
            }
            .scrollIndicators(.hidden)
            .background(Color(.systemGray4))
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

struct HeaderMenuView: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("profilePic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Omar Thamri")
                Spacer()
                Image(systemName: "chevron.down.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color(.systemGray3))
            }
            Divider()
            HStack(spacing: 15) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text("Create another profile")
                Spacer()
            }
            .foregroundStyle(Color(.darkGray))
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}
