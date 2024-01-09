//
//  HeaderMenuView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI
import Kingfisher

struct HeaderMenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                ZStack {
                    Image("no_profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                Text("\(viewModel.currentUser?.firstName ?? "") \(viewModel.currentUser?.familyName ?? "")")
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
