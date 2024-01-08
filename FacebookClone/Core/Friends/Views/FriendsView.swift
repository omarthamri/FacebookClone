//
//  FriendsView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct FriendsView: View {
    private var viewModel = FriendsViewModel()
    var body: some View {
        NavigationView {
            VStack {
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
                            Text("\(viewModel.users[0].friendsRequestsIds.count)")
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
                                ForEach(viewModel.users[0].friendsRequestsIds,id: \.self) { id in
                                    if let user = viewModel.users.first(where: {$0.id == id}) {
                                        FriendsCell(title: "\(user.firstName) \(user.familyName)", imageName: user.profileImageName ?? "")
                                    }
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        Spacer()
                    }
                    .padding()
                    Divider()
                }
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
