//
//  ContentView.swift
//  FacebookClone
//
//  Created by omar thamri on 26/12/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Color.white
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        Header()
                        createPost()
                        DividerView(widthRectangle: proxy.size.width)
                        StoryFeed()
                        DividerView(widthRectangle: proxy.size.width)
                        ForEach(0..<3) { _ in
                            PostView()
                            DividerView(widthRectangle: proxy.size.width - 15)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .foregroundStyle(.black)
                .refreshable {
                    
                }
            }
        }
    }
}

struct Header: View {
    let facebookBlue = Color(red: 66/255, green: 103/255, blue: 178/255,opacity: 1)
    var body: some View {
        HStack(spacing: 24) {
            Text("facebook")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(Color(facebookBlue))
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
           Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFill()
                .font(.system(size: 18,weight: .bold))
                .frame(width: 24, height: 24)
            Image("messenger")
                .resizable()
                .scaledToFill()
                 .frame(width: 24, height: 24)
        }
        .padding(.horizontal)
    }
}

struct createPost: View {
    var body: some View {
        VStack {
            HStack {
                Image("profilePic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                HStack {
                    Text("What's on your mind?")
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .overlay {
                    Capsule()
                        .stroke(Color(.systemGray4),lineWidth: 1)
                }
                .padding(.leading,5)
                .padding(.trailing,15)
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding()

        }
    }
}

#Preview {
    FeedView()
}

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

struct MyStoryCard: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 170)
                .foregroundStyle(Color(.systemGray6))
            ZStack(alignment: .bottom) {
                Image("profilePic")
                    .resizable()
                    .frame(width: 100, height: 110)
                    .scaledToFit()
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
                VStack(spacing: 0) {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Circle())
                        .font(.system(size: 20,weight: .bold))
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray6),lineWidth: 3)
                        }
                    VStack {
                        Spacer()
                            .frame(height: 5)
                        Text("Create")
                        Text("story")
                    }
                    
                    .font(.system(size: 12,weight: .semibold))
                }
                .offset(y: 45)
            }
        }
    }
}

struct StoryCard: View {
    let imageName: String
    let profilePic: String
    let title: String
    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 170)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading,spacing: 100) {
                Image(profilePic)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.blue,lineWidth: 4)
                    }
                Text(title)
                    .font(.system(size: 12,weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding(.leading,8)
        }
        
    }
}


struct StoryFeed: View {
    let titles = ["Jim Halpert","Wanda Maximov","Thomas Shelby","Nancy Wheeler"]
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCard()
                ForEach(1..<5) { i in
                  StoryCard(imageName: "Story\(i)", profilePic: "profilePic\(i)", title: titles[i-1])
                }
            }
            .padding(.leading)
            .padding(.vertical,5)
        }
        .scrollIndicators(.hidden)
    }
}


struct PostView: View {
    let facebookBlue = Color(red: 66/255, green: 103/255, blue: 178/255,opacity: 1)
    
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
            Image("office")
                .resizable()
                .scaledToFill()
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
