//
//  PostGridView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct PostGridView: View {

    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    private var viewModel = MarketPlaceViewModel()
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 2) - 2
    
    var body: some View {
        
            LazyVGrid(columns: gridItems,spacing: 1) {
                ForEach(viewModel.items) { item in
                            VStack {
                                Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension,height: imageDimension)
                            .clipped()
                                Text("\(item.item_price)$ - \(item.item_name)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                    }
            }
        }
    }
}
