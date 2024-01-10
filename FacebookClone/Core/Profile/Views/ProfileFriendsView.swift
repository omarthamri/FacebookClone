//
//  ProfileFriendsView.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI
import Kingfisher

struct ProfileFriendsView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    private var width: CGFloat
    @StateObject private var viewModel: FeedViewModel
    init(width: CGFloat, viewModel: FeedViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("\(viewModel.currentUser?.friendsIds.count ?? 0) friends")
                        .font(.subheadline)
                        .foregroundStyle(Color(.darkGray))
                }
                Spacer()
                Text("Find Friends")
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            LazyVGrid(columns: gridItems,spacing: 1) {
                ForEach(viewModel.friends ?? [], id: \.self) { friend in
                    VStack(alignment: .center,spacing: 0) {
                        ZStack {
                            Image("no-profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3) - 20,height: (width / 3) - 20)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            KFImage(URL(string: friend.profileImageName ?? "" ))
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3) - 20,height: (width / 3) - 20)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                            Text("\(friend.firstName) \(friend.familyName)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.vertical)
                        
                    }
                }
            }
            .padding(.horizontal)
            if let count = viewModel.friends?.count, count > 0 {
                Text("See all friends")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
                    .frame(width: width - 30, height: 44)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            DividerView(widthRectangle: width)
                .padding(.vertical)
        }
    }
}
