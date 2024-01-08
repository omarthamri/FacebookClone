//
//  AddNameView.swift
//  FacebookClone
//
//  Created by omar thamri on 4/1/2024.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading,spacing: 20) {
            
                Text("What's your name?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                Text("Enter the name you use in real life")
                                .font(.footnote)
                                
                
                HStack {
                    TextField("First name",text: $viewModel.firstName)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(.white)
                        .frame(width: proxy.size.width / 2 - 25, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    TextField("Surname",text: $viewModel.familyName)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(.white)
                        .frame(width: proxy.size.width / 2 - 25, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                            NavigationLink {
                                AddAgeView(viewModel: viewModel)
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Next")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: proxy.size.width - 30,height: 44)
                                    .background(Color(.systemBlue))
                                    .cornerRadius(30)
                            }
                            .padding(.vertical)
                            Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Spacer()
                        Text("Already have an account?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                })
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                               Image(systemName: "arrow.backward")
                                   .imageScale(.large)
                                   .onTapGesture {
                                       dismiss()
                                   }
                           }
        }
        .background(Color(.systemGray5))
        }
    }
}

#Preview {
    AddNameView()
}
