//
//  HeaderView.swift
//  FacebookClone
//
//  Created by omar thamri on 2/1/2024.
//

import SwiftUI

struct HeaderView: View {
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

#Preview {
    HeaderView()
}
