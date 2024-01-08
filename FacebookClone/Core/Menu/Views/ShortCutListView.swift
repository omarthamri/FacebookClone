//
//  ShortCutListView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct ShortCutListView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your shortcuts")
                .font(.headline)
                .foregroundStyle(Color(.darkGray))
            HStack {
                ShortCutView(width: width * 0.45,title: "Memories",imageName: "gobackward")
                ShortCutView(width: width * 0.45,title: "Saved",imageName: "bookmark.fill")
            }
            HStack {
                ShortCutView(width: width * 0.45,title: "Groups",imageName: "person.2.circle")
                ShortCutView(width: width * 0.45,title: "Video",imageName: "play.tv.fill")
            }
            HStack {
                ShortCutView(width: width * 0.45,title: "Marketplace",imageName: "storefront.fill")
                ShortCutView(width: width * 0.45,title: "Friends",imageName: "person.2.fill")
            }
            HStack {
                ShortCutView(width: width * 0.45,title: "Feeds",imageName: "calendar.badge.clock")
                ShortCutView(width: width * 0.45,title: "Events",imageName: "calendar")
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("See more")
                    .font(.headline)
                    .frame(width: width - 30, height: 44)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.black)
                    .padding(.vertical)
            })
        }
        .padding(.horizontal)
    }
}
