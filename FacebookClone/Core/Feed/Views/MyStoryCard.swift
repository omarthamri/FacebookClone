//
//  MyStoryCard.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI
import Kingfisher

struct MyStoryCard: View {
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 170)
                .foregroundStyle(Color(.systemGray6))
            ZStack(alignment: .bottom) {
                ZStack {
                    Image("no_profile")
                        .resizable()
                        .frame(width: 100, height: 110)
                        .scaledToFill()
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
                    if viewModel.profileImage == Image("no_profile") {
                        KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                            .resizable()
                            .frame(width: 100, height: 110)
                            .scaledToFill()
                            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
                    } else {
                        viewModel.profileImage
                            .resizable()
                            .frame(width: 100, height: 110)
                            .scaledToFit()
                            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
                    }
                }
                VStack(spacing: 0) {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Circle())
                        .font(.system(size: 20,weight: .bold))
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray6),lineWidth: 3)
                        }
                    VStack {
                        Spacer()
                            .frame(height: 5)
                        Text("Create")
                        Text("story")
                    }
                    
                    .font(.system(size: 12,weight: .semibold))
                }
                .offset(y: 45)
            }
        }
    }
}

#Preview {
    MyStoryCard(viewModel: FeedViewModel())
}
