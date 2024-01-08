//
//  AgreementView.swift
//  FacebookClone
//
//  Created by omar thamri on 4/1/2024.
//

import SwiftUI

struct AgreementView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading,spacing: 20) {
            
                Text("Agree to Facebook's terms and policies")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                Text("People who use our service may have uploaded your contact information to Facebook.")
                    .font(.footnote) +
                Text(" Learn more")
                    .font(.footnote)
                    .foregroundStyle(.blue)
                Text("By tapping")
                    .font(.footnote) +
                Text(" I agree")
                    .font(.footnote)
                    .fontWeight(.bold) +
                Text(", you agree to create an account and to Facebook's ")
                    .font(.footnote) +
                Text("terms, Privacy Policy")
                    .font(.footnote)
                    .foregroundStyle(.blue) +
                Text(" and ")
                    .font(.footnote) +
                Text("Cookies Policy")
                    .font(.footnote)
                    .foregroundStyle(.blue)
                Text("The ")
                    .font(.footnote) +
                Text("Privacy Policy")
                    .font(.footnote)
                    .foregroundStyle(.blue) +
                Text(" describes the way we can use the information we collect when you create an account. For example, we use this information to provide, personalise and improve our products, including ads.")
                    .font(.footnote)
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("I Agree")
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
    AgreementView(viewModel: RegistrationViewModel())
}
