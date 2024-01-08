//
//  VideoCell.swift
//  FacebookClone
//
//  Created by omar thamri on 5/1/2024.
//

import SwiftUI
import AVKit

struct VideoCell: View {
    let facebookBlue = Color(red: 66/255, green: 103/255, blue: 178/255,opacity: 1)
    let player: AVPlayer
    init(player: AVPlayer) {
        self.player = player
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("profilePic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 0) {
                        Text("Omar Thamri")
                            .font(.system(size: 14, weight: .semibold))
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(facebookBlue)
                }
                Spacer()
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.darkGray))
            }
            .padding(.horizontal)
            Text("Time to party with the best team ever :D")
            .padding(.horizontal)
            CustomVideoPlayer(player: player)
                .frame(height: 300)
                .onTapGesture {
                            switch player.timeControlStatus {
                            case .paused:
                                player.play()
                            case .waitingToPlayAtSpecifiedRate:
                                break
                            case .playing:
                                player.pause()
                            @unknown default:
                                break
                            }
                        }
            HStack {
                HStack(spacing: 3) {
                    Image("like")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("12k")
                }
                Spacer()
                HStack {
                    Text("4 comments")
                    Text("•")
                        .fontWeight(.bold)
                    Text("2 shares")
                }
            }
            .foregroundStyle(facebookBlue)
            .font(.system(size: 12))
            .padding(.horizontal)
            Divider()
                .background(.white.opacity(0.5))
            HStack {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                HStack {
                    Image("icone-messager-noir")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Send")
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
            }
            .foregroundStyle(facebookBlue)
            .font(.system(size: 14))
            .padding(.horizontal)
        }
    }
}

#Preview {
    VideoCell(player: AVPlayer())
}
