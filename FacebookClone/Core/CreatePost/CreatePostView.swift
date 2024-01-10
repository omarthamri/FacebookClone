//
//  CreatePostView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI
import Kingfisher

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showPhotoPicker: Bool = false
    @StateObject private var viewModel: FeedViewModel
    private var width: CGFloat
    init(viewModel: FeedViewModel,width: CGFloat) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
    }
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                    Divider()
                    HStack(alignment: .top) {
                        ZStack {
                            Image("no-profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                            
                        VStack(alignment: .leading) {
                            Text("\(viewModel.currentUser?.firstName ?? "") \(viewModel.currentUser?.familyName ?? "")")
                            HStack {
                                ChoicesView(leftImageName: "person.2.fill", title: "Friends")
                                ChoicesView(leftImageName: "", title: "Album")
                            }
                            ChoicesView(leftImageName: "camera", title: "Off")
                        }
                    }
                    .padding()
                TextField("What's on your mind?",text: $viewModel.mindText,axis: .vertical)
                        .padding(.horizontal)
                viewModel.createPostImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: width - 30, height: 300)
                        .clipped()
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                    Divider()
                    HStack(alignment: .bottom) {
                        Spacer()
                        Button(action: {
                            showPhotoPicker.toggle()
                        }, label: {
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .foregroundStyle(.green)
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.blue)
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "face.smiling")
                                .foregroundStyle(.yellow)
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("pin")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.red)
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundStyle(Color(.darkGray))
                        })
                        Spacer()
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            Button(action: {
                                viewModel.createPostImage = Image("")
                                viewModel.createPostSelectedImage = nil
                                viewModel.mindText = ""
                                dismiss()
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            })
                            
                            Text("Create post")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            Task {
                                try await viewModel.uploadPost()
                                viewModel.createPostImage = Image("")
                                viewModel.createPostSelectedImage = nil
                                viewModel.mindText = ""
                                dismiss()
                                                }
                        }, label: {
                            Text("Post")
                                .frame(width: 80, height: 35)
                                .foregroundStyle(viewModel.mindText.count > 0 ? .white : Color(.darkGray))
                                .background(viewModel.mindText.count > 0 ? .blue : Color(.systemGray5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                        .disabled(viewModel.mindText.count == 0)
                    }
            }
                .photosPicker(isPresented: $showPhotoPicker, selection: $viewModel.createPostSelectedImage)
        }
        }
}

#Preview {
    CreatePostView(viewModel: FeedViewModel(), width: 300)
}
