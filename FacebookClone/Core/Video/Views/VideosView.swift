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
    var body: some View {
            GeometryReader { proxy in
                NavigationView {
                    ScrollView {
                        VideoOptionsView()
                        VideoCell(player: player)
                    }
                    .onAppear{
                                                    playInitialVideoIfNecessary()
                                            }
                    .onDisappear{
                        player.pause()
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
    
    private func playInitialVideoIfNecessary() {
            let playerItem = AVPlayerItem(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
            player.replaceCurrentItem(with: playerItem)
        player.play()
        }
}

#Preview {
    VideosView()
}
