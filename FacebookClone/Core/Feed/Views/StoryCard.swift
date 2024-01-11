//
//  StoryCard.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI
import Kingfisher

struct StoryCard: View {
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        HStack {
            ForEach(viewModel.friends ?? [], id: \.self) { friend in
                ZStack(alignment: .leading) {
                    ZStack {
                        Image("no_profile")
                            .resizable()
                            .frame(width: 100, height: 170)
                            .scaledToFit()
                        KFImage(URL(string:  friend.coverImageName ?? ""))
                                .resizable()
                                .frame(width: 100, height: 170)
                                .scaledToFit()
                        
                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    VStack(alignment: .leading,spacing: 100) {
                        KFImage(URL(string: friend.profileImageName ?? ""))
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .overlay{
                                Circle().stroke(.blue,lineWidth: 4)
                            }
                        Text("\(friend.firstName) \(friend.familyName)")
                            .font(.system(size: 12,weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .padding(.leading,8)
                }
            }
        }
        
    }
}

#Preview {
    StoryCard(viewModel: FeedViewModel())
}
