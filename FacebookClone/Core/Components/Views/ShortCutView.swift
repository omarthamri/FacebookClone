//
//  ShortCutView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct ShortCutView: View {
    private var width: CGFloat
    private var title: String
    private var imageName: String
    init(width: CGFloat,title: String,imageName: String) {
        self.width = width
        self.title = title
        self.imageName = imageName
    }
    var body: some View {
            VStack(alignment: .leading,spacing: 10) {
                Image(systemName: imageName)
                    .foregroundStyle(.blue)
                Text(title)
                    .font(.headline)
                HStack { Spacer()}
            }
            .padding(.horizontal)
            .frame(width: width, height: 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
    }
}
