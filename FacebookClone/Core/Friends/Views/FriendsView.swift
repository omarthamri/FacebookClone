//
//  FriendsView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading,spacing: 25) {
                HStack {
                    TagView(title: "Suggestions")
                    TagView(title: "Your friends")
                    Spacer()
                }
                Divider()
                HStack {
                    Text("Friend requests")
                         .font(.headline)
                         .fontWeight(.bold)
                    Text("3")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("See All")
                    })
                    
                }
                ScrollView {
                    VStack(alignment: .leading,spacing: 24) {
                        FriendsCell(title: "Pam Beesley", imageName: "pam")
                        FriendsCell(title: "Dwight Schrute", imageName: "dwight")
                        FriendsCell(title: "Natasha Romanoff", imageName: "romanoff")
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                   Text("Friends")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    FriendsView()
}

struct FriendsCell: View {
    private var title: String
    private var imageName: String
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                
            }
        }
    }
}
