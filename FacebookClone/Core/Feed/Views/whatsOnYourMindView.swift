//
//  createPostView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI
import Kingfisher

struct whatsOnYourMindView: View {
    @State private var showCreatePostView: Bool = false
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            HStack {
                NavigationLink {
                    ProfileView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    ZStack {
                        Image("no_profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFill()
                            .clipShape(Circle())
                        if viewModel.profileImage == Image("no_profile") {
                            KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFill()
                                .clipShape(Circle())
                        } else {
                            viewModel.profileImage
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
                }
                Button {
                    showCreatePostView.toggle()
                } label: {
                    HStack {
                        Text("What's on your mind?")
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .overlay {
                        Capsule()
                            .stroke(Color(.systemGray4),lineWidth: 1)
                    }
                    .padding(.leading,5)
                    .padding(.trailing,15)
                }
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding()

        }
        .fullScreenCover(isPresented: $showCreatePostView) {
            CreatePostView(viewModel: viewModel)
        }
    }
}

#Preview {
    whatsOnYourMindView(viewModel: FeedViewModel())
}
