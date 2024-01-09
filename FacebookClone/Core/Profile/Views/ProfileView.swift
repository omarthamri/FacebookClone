//
//  ProfileView.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: FeedViewModel
    private var postIndex: Int
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.postIndex = viewModel.posts.firstIndex(where: {$0.userId == viewModel.users[0].id}) ?? 0
    }
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ProfileHeaderView(width: proxy.size.width, viewModel: viewModel)
                    ProfileOptionsView()
                        .padding(.bottom)
                    ProfileFriendsView(width: proxy.size.width, viewModel: viewModel)
                    VStack {
                        HStack {
                                Text("Posts")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            Spacer()
                            Text("Filters")
                                .font(.headline)
                                .foregroundStyle(.blue)
                        }
                        HStack(spacing: 16) {
                            if viewModel.profileImage == Image("no_profile") {
                                KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                viewModel.profileImage
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                            Text("What's on your mind?")
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.green)
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    VStack(spacing: 0) {
                        Divider()
                        Color(.systemGray6)
                            .frame(height: 70)
                            .overlay {
                                HStack {
                                    HStack(spacing: 10) {
                                        Image(systemName: "play.rectangle.fill")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.red)
                                        Text("Reel")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color(.darkGray))
                                    }
                                    .padding(.horizontal,25)
                                    .padding(.vertical,8)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    HStack(spacing: 10) {
                                        Image(systemName: "video.fill")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.red)
                                        Text("Live")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color(.darkGray))
                                    }
                                    .padding(.horizontal,25)
                                    .padding(.vertical,8)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                        }
                    }
                    HStack {
                        Image(systemName: "text.bubble.fill")
                        Text("Manage posts")
                    }
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
                    .frame(width: proxy.size.width - 30, height: 44)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.vertical)
                    DividerView(widthRectangle: proxy.size.width)
                    PostView(viewModel: viewModel, index: postIndex)
                    Spacer()
                }
                .navigationTitle("\(viewModel.currentUser?.firstName ?? "") \(viewModel.currentUser?.familyName ?? "")")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            })
                    }

            }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ProfileView(viewModel: FeedViewModel())
}
