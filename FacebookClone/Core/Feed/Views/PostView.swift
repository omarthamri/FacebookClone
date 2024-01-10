//
//  PostView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    let facebookBlue = Color(red: 66/255, green: 103/255, blue: 178/255,opacity: 1)
    private var viewModel: FeedViewModel
    private var index: Int
    private var user: User
    init(viewModel: FeedViewModel,index: Int) {
        self.viewModel = viewModel
        self.index = index
        self.user = viewModel.users.first(where: {$0.id == viewModel.posts[index].userId}) ?? viewModel.users[0]
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Image("no-profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    KFImage(URL(string: viewModel.posts[index].user?.profileImageName ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading,spacing: 0) {
                    Text("\(viewModel.posts[index].user?.firstName ?? "") \(viewModel.posts[index].user?.familyName ?? "")")
                            .font(.system(size: 14, weight: .semibold))
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(facebookBlue)
                }
                Spacer()
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.darkGray))
            }
            .padding(.horizontal)
            Text(viewModel.posts[index].postTitle)
            .padding(.horizontal)
            KFImage(URL(string: viewModel.posts[index].postUrl))
                .resizable()
                .scaledToFill()
            HStack {
                HStack(spacing: 3) {
                    Image("like")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("\(viewModel.posts[index].postLikes)")
                }
                Spacer()
                HStack {
                    Text("\(viewModel.posts[index].postComments) comments")
                    Text("•")
                        .fontWeight(.bold)
                    Text("\(viewModel.posts[index].postShares) shares")
                }
            }
            .foregroundStyle(facebookBlue)
            .font(.system(size: 12))
            .padding(.horizontal)
            Divider()
                .background(.white.opacity(0.5))
            HStack {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                HStack {
                    Image("icone-messager-noir")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Send")
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
            }
            .foregroundStyle(facebookBlue)
            .font(.system(size: 14))
            .padding(.horizontal)
        }
    }
}

#Preview {
    PostView(viewModel: FeedViewModel(), index: 0)
}
