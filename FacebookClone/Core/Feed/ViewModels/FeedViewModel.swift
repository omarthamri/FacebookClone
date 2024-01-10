//
//  FeedViewModel.swift
//  FacebookClone
//
//  Created by omar thamri on 7/1/2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
import Combine
import Kingfisher

class FeedViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
            didSet { Task {try await loadImage(fromItem: selectedImage)} }
        }
    @Published var selectedCoverImage: PhotosPickerItem? {
            didSet { Task {try await loadCoverImage(fromItem: selectedCoverImage)} }
        }
    @Published var createPostSelectedImage: PhotosPickerItem? {
            didSet { Task {try await loadCreatePostImage(fromItem: createPostSelectedImage)} }
        }
    @Published var profileImage: Image = Image("no_profile")
    @Published var coverImage: Image = Image("no_profile")
    @Published var createPostImage: Image = Image("")
    private var uiImage: UIImage?
    @Published var friends: [User]?
    @Published var currentUser: User?
    @Published var mindText: String = ""
    @Published var posts = [Post]()
    private var cancellables = Set<AnyCancellable>()
    
        
    init() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
        UserService.shared.$friends.sink { [weak self] friends in
            self?.friends = friends
        }
        .store(in: &cancellables)
        Task { try await fetchPosts() }
    }
    
    func uploadPost() async throws {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            guard let uiImage = uiImage else { return }
            let postRef = Firestore.firestore().collection("posts").document()
            guard let imageUrl = try await ImageUploader.uploadPostImage(image: uiImage) else { return }
            let post = Post(id: postRef.documentID, userId: uid, postTitle: mindText, postUrl: imageUrl, postLikes: 5, postComments: 3, postShares: 2, isVideo: false, timestamp: Timestamp())
            guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
            try await postRef.setData(encodedPost )
        }
    
    func loadImage(fromItem item: PhotosPickerItem?) async throws{
            guard let item = item else { return }
            guard let data = try? await item.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: data) else { return }
            self.uiImage = uiImage
            self.profileImage = Image(uiImage: uiImage)
            try await updateProfileImage()
    }
    func loadCoverImage(fromItem item: PhotosPickerItem?) async throws{
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
        try await updateCoverImage()
    }
    func loadCreatePostImage(fromItem item: PhotosPickerItem?) async throws{
            guard let item = item else { return }
            guard let data = try? await item.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: data) else { return }
            self.uiImage = uiImage
            self.createPostImage = Image(uiImage: uiImage)
           // try await updateCreatePostImage()
    }
    private func updateProfileImage() async throws {
            guard let image = self.uiImage else { return }
            guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
            try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
            
    }
    private func updateCoverImage() async throws {
            guard let image = self.uiImage else { return }
            guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
            try await UserService.shared.updateUserCoverImage(withImageUrl: imageUrl)
            
    }
    @MainActor
        func fetchPosts() async throws {
            self.posts = try await PostService.fetchFeedPosts()
        }
    @Published var users: [User] = [
        User(id: "0", firstName: "Omar", familyName: "Thamri", email: "omar.thamri@gmail.com", profileImageName: "profilePic", coverImageName: "cover_picture", age: 28, gender: "male", friendsIds: ["1","2","3","4"], friendsRequestsIds: ["5","6","7"]),
       User(id: "1", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", coverImageName: "Story1", age: 42, gender: "male", friendsIds: [], friendsRequestsIds: []),
       User(id: "2", firstName: "Wanda", familyName: "Maximov", email: "wanda.maximov@gmail.com", profileImageName: "profilePic2", coverImageName: "Story2", age: 34, gender: "female", friendsIds: [], friendsRequestsIds: []),
       User(id: "3", firstName: "Thomas", familyName: "Shelby", email: "thomas.shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "Story3", age: 44, gender: "male", friendsIds: [], friendsRequestsIds: []),
        User(id: "4", firstName: "Nancy", familyName: "Wheeler", email: "nancy.wheeler@gmail.com", profileImageName: "profilePic4", coverImageName: "Story4", age: 27, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "5", firstName: "Pam", familyName: "Beesley", email: "pam.beesley@gmail.com", profileImageName: "pam", coverImageName: "Story4", age: 43, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "6", firstName: "Dwight", familyName: "Schrute", email: "dwight.schrute@gmail.com", profileImageName: "dwight", coverImageName: "Story4", age: 50, gender: "female", friendsIds: [], friendsRequestsIds: []),
        User(id: "7", firstName: "Natasha", familyName: "Romanov", email: "natasha.romanov@gmail.com", profileImageName: "romanoff", coverImageName: "Story4", age: 38, gender: "female", friendsIds: [], friendsRequestsIds: [])
    ]
    
}
