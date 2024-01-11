//
//  PostService.swift
//  FacebookClone
//
//  Created by omar thamri on 10/1/2024.
//

import Foundation

import Foundation
import Firebase

struct PostService {
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").order(by: "timestamp",descending: true).getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        for i in 0..<posts.count {
            let ownerUid = posts[i].userId
            let postUser = try await UserService.fetchUser(withuid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").whereField("userId", isEqualTo: uid).getDocuments()
        let posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        return posts
    }
    
}
