//
//  CustomButton.swift
//  FacebookClone
//
//  Created by omar thamri on 6/1/2024.
//

import SwiftUI

struct CustomButton: View {
    private var title: String
    private var imageName: String
    private var backgroundColor: Color
    private var foregroundColor: Color
    init(title: String, imageName: String,backgroundColor: Color,foregroundColor: Color) {
        self.title = title
        self.imageName = imageName
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    var body: some View {
        HStack {
            Image(systemName: imageName)
            if title != "" {
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
        }
        .foregroundStyle(foregroundColor)
        .padding(.horizontal)
        .frame(height: 34)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
