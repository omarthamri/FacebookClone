//
//  createPostView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct whatsOnYourMindView: View {
    @State private var show
    var body: some View {
        VStack {
            HStack {
                Image("profilePic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Button {
                    
                } label: {
                    HStack {
                        Text("What's on your mind?")
                            .foregroundStyle(.black)
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
                }
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding()

        }
        .fullScreenCover(isPresented: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/) {
            
        }
    }
}

#Preview {
    whatsOnYourMindView()
}
