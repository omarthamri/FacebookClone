//
//  MarketplaceView.swift
//  FacebookClone
//
//  Created by omar thamri on 3/1/2024.
//

import SwiftUI

struct MarketplaceView: View {
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                    ScrollView {
                        HStack {
                            MarketPlaceButton(width: proxy.size.width,title: "Sell",imageName: "square.and.pencil")
                            MarketPlaceButton(width: proxy.size.width,title: "Categories",imageName: "list.bullet")
                        }
                        .padding()
                        Divider()
                        VStack(alignment: .leading) {
                            HStack(spacing: 2) {
                                Text("Today's picks")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                                Image("pin")
                                    .resizable()
                                    .frame(width: 20, height: 16)
                                Text("London")
                                    .font(.subheadline)
                                    .foregroundStyle(.blue)
                            }
                            .padding()
                            PostGridView( )
                        }
                    }
                    .scrollIndicators(.hidden)
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                           Text("Marketplace")
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

#Preview {
    MarketplaceView()
}

struct MarketPlaceButton: View {
    private var width: CGFloat
    private var title: String
    private var imageName: String
    init(width: CGFloat,title: String,imageName: String) {
        self.width = width
        self.title = title
        self.imageName = imageName
    }
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(width: width * 0.45, height: 44)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
