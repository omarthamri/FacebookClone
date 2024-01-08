//
//  MenuCell.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI


struct MenuCell: View {
    private var title: String
    private var imageName: String
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack(spacing: 15) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                Text(title)
                
                Spacer()
                Image(systemName: "chevron.down")
            }
            .font(.headline)
            .padding(.horizontal)
            .padding(.vertical,7)
        }
    }
}
