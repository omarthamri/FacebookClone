//
//  ProfileOptionsView.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI

struct ProfileOptionsView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    Text("Posts")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical,7)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    Text("Photos")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                    Text("Reels")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                }
            }
            .padding(.leading)
            Divider()
        }
    }
}
