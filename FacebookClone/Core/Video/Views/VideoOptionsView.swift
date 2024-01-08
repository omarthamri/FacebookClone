//
//  VideoOptionsView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct VideoOptionsView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 24) {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    Text("For you")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical,7)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    Text("Live")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                    Text("Gaming")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                    Text("Reels")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                    Text("Following")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                }
            }
            .padding(.leading)
            Divider()
        }
        .padding(.vertical)
    }
}
