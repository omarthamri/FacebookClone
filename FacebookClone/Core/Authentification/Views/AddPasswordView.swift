//
//  AddPasswordView.swift
//  FacebookClone
//
//  Created by omar thamri on 4/1/2024.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading,spacing: 20) {
            
                Text("Create a password")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                Text("Create a password whith at least 6 letters or numbers. It should be something that others can't guess.")
                                .font(.footnote)
                SecureField("Password",text: $viewModel.password)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(.white)
                        .frame(width: proxy.size.width - 30, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray,lineWidth: 1)
                        }
                            NavigationLink {
                                AgreementView(viewModel: viewModel)
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
    AddPasswordView(viewModel: RegistrationViewModel())
}
