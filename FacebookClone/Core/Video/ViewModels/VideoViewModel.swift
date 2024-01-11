//
//  VideoViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 7/1/2024.
//

import Foundation

class VideoViewModel: ObservableObject {
    
    @Published var videoPosts = [
        Video(id: UUID().uuidString, videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", videoDescription: "Funny video 😂"),
        Video(id: UUID().uuidString, videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", videoDescription: "Inspiring story 🙂"),
        Video(id: UUID().uuidString, videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4", videoDescription: "worth watching 😎"),
    ]
    
}
