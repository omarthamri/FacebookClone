//
//  ChoicesView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct ChoicesView: View {
    private var leftImageName: String
    private var title: String
    init(leftImageName: String, title: String) {
        self.leftImageName = leftImageName
        self.title = title
    }
    var body: some View {
        HStack (spacing: 10){
            Image(systemName: leftImageName)
                .resizable()
                .frame(width: 14, height: 12)
            Text(title)
                .fontWeight(.bold)
            Text("▼")
                .font(.caption2)
        }
        .font(.subheadline)
        .foregroundStyle(.blue)
        .padding(.horizontal)
        .padding(.vertical,5)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ChoicesView(leftImageName: "person.2.fill", title: "Friends")
}
