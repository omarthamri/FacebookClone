//
//  AddEmailView.swift
//  FacebookClone
//
//  Created by omar thamri on 4/1/2024.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading,spacing: 20) {
            
                Text("What's your email address?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                Text("Enter the email address at which you can be contacted. No one will see this on your profile.")
                                .font(.footnote)
                TextField("Email address",text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(.white)
                        .frame(width: proxy.size.width - 30, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray,lineWidth: 1)
                        }
                Text("You'll also recieve emails from us and can opt out anytime.")
                                .font(.caption) +
                Text(" Learn more")
                                .font(.caption)
                                .foregroundStyle(.blue)
                            NavigationLink {
                                AddPasswordView(viewModel: viewModel)
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Next")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: proxy.size.width - 30,height: 44)
                                    .background(Color(.systemBlue))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                            .padding(.top)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sign up with Mobile Number")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.darkGray))
                        .frame(width: proxy.size.width - 30,height: 44)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.gray,lineWidth: 1)
                        }
                })
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
    AddEmailView(viewModel: RegistrationViewModel())
}
