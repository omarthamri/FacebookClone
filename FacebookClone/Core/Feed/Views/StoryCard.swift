//
//  StoryCard.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct StoryCard: View {
    let imageName: String
    let profilePic: String
    let title: String
    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 170)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading,spacing: 100) {
                Image(profilePic)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.blue,lineWidth: 4)
                    }
                Text(title)
                    .font(.system(size: 12,weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding(.leading,8)
        }
        
    }
}

#Preview {
    StoryCard(imageName: "Story1", profilePic: "profilePic1", title: "Jim Halpert")
}
