//
//  StoryFeed.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct StoryFeed: View {
    private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCard(viewModel: viewModel)
                ForEach(viewModel.users[0].friendsIds, id: \.self) { id in
                    if let friend = viewModel.users.first(where: {$0.id == id}) {
                        StoryCard(imageName: friend.coverImageName ?? "", profilePic: friend.profileImageName ?? "", title: friend.firstName + friend.familyName)
                    }
                }
            }
            .padding(.leading)
            .padding(.vertical,5)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoryFeed(viewModel: FeedViewModel())
}
