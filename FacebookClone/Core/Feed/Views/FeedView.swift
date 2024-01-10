//
//  ContentView.swift
//  FacebookClone
//
//  Created by omar thamri on 26/12/2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { proxy in
                    Color.white
                        .ignoresSafeArea()
                    VStack {
                        ScrollView {
                            HeaderView()
                            whatsOnYourMindView(viewModel: viewModel, width: proxy.size.width)
                            DividerView(widthRectangle: proxy.size.width)
                            StoryFeed(viewModel: viewModel)
                            DividerView(widthRectangle: proxy.size.width)
                            ForEach( 0 ..< viewModel.posts.count,id: \.self) { index in
                                PostView(viewModel: viewModel, index: index)
                                DividerView(widthRectangle: proxy.size.width - 15)
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .refreshable {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}





