//
//  VideosView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI
import AVKit

struct VideosView: View {
    @State private var player = AVPlayer()
    @StateObject private var viewModel = VideoViewModel()
    @State private var isInitialVideoPlayed = false
    var body: some View {
            GeometryReader { proxy in
                NavigationView {
                    ScrollView {
                        VideoOptionsView()
                        ForEach(viewModel.videoPosts,id: \.self) { videoPost in
                            VideoCell(videoPost: videoPost,viewModel: viewModel)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                           Text("Video")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 24) {
                                Image(systemName: "person.fill")
                                Image(systemName: "magnifyingglass")
                                    
                            }
                            .fontWeight(.bold)
                            
                        }
                }
                }
            }
    }
    
    
}


