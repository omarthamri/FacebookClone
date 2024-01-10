//
//  ProfileHeaderView.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    private var width: CGFloat
    @StateObject private var viewModel: FeedViewModel
    @State private var showPhotoPicker: Bool = false
    @State private var showCoverPhotoPicker: Bool = false
    init(width: CGFloat,viewModel: FeedViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            Button(action: {
                showCoverPhotoPicker.toggle()
            }, label: {
                ZStack {
                    Image("no_profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 250)
                    if viewModel.coverImage == Image("no_profile") {
                        KFImage(URL(string: viewModel.currentUser?.coverImageName ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: 250)
                    } else {
                        viewModel.coverImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: 250)
                    }
                }
            })
            
            Color
                .white
                .frame(height: 180)
        }
        .photosPicker(isPresented: $showCoverPhotoPicker, selection: $viewModel.selectedCoverImage)
        .overlay {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Button(action: {
                            showPhotoPicker.toggle()
                        }, label: {
                            ZStack {
                                Image("no_profile")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .stroke(Color(.systemGray6),lineWidth: 3)
                                    }
                                    .padding(.top,170)
                                if viewModel.profileImage == Image("no_profile") {
                                    KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle()
                                                .stroke(Color(.systemGray6),lineWidth: 3)
                                        }
                                        .padding(.top,170)
                                } else {
                                    viewModel.profileImage
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle()
                                                .stroke(Color(.systemGray6),lineWidth: 3)
                                        }
                                        .padding(.top,170)
                                }
                            }
                           
                            
                        })
                        
                        Text("\(viewModel.currentUser?.firstName ?? "") \(viewModel.currentUser?.familyName ?? "")")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(viewModel.currentUser?.friendsIds.count ?? 0) ")
                            .font(.headline) +
                        Text("friends")
                            .font(.headline)
                            .foregroundStyle(.gray)
                        HStack {
                            CustomButton(title: "Add to story", imageName: "plus", backgroundColor: .blue, foregroundColor: .white)
                            
                            CustomButton(title: "Edit profile", imageName: "pencil", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                            CustomButton(title: "", imageName: "ellipsis", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal)
                DividerView(widthRectangle: width)
                    .padding(.vertical)
            }
        }
        .photosPicker(isPresented: $showPhotoPicker, selection: $viewModel.selectedImage)
    }
}
