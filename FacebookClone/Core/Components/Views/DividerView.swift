//
//  DividerView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct DividerView: View {
    private var widthRectangle: CGFloat
    init(widthRectangle: CGFloat) {
        self.widthRectangle = widthRectangle
    }
    var body: some View {
        Rectangle()
            .frame(width: widthRectangle, height: 6)
            .foregroundStyle(Color(.systemGray4))
    }
}
