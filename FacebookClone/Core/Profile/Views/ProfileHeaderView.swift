//
//  ProfileHeaderView.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    private var width: CGFloat
    private var viewModel: FeedViewModel
    init(width: CGFloat,viewModel: FeedViewModel) {
        self.width = width
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Image(viewModel.users[0].coverImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            Color
                .white
                .frame(height: 180)
        }
        .overlay {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Image(viewModel.users[0].profileImageName ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color(.systemGray6),lineWidth: 3)
                            }
                            .padding(.top,170)
                        Text("\(viewModel.users[0].firstName) \(viewModel.users[0].familyName)")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(viewModel.users[0].friendsIds.count) ")
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
    }
}
