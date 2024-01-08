//
//  TagView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct TagView: View {
    private var title: String
    init(title: String) {
        self.title = title
    }
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical,8)
            .font(.subheadline)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    TagView(title: "Friends")
}
