//
//  AddgenderView.swift
//  FacebookClone
//
//  Created by omar thamri on 4/1/2024.
//

import SwiftUI

struct AddgenderView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var genderChoice: [String] = ["Female","Male","More options"]
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading,spacing: 20) {
            
                Text("What's your gender?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                Text("You can change who sees your gender on your profile later")
                                .font(.footnote)
                VStack(alignment: .leading,spacing: 24) {
                    ForEach(genderChoice,id: \.self) { choice in
                        Button {
                            viewModel.gender = choice
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(choice)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if choice == "More options" {
                                        Text("Select More option to choose another gender or if you'd rather not say.")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(.darkGray))
                                            .padding(.trailing)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                Circle()
                                    .stroke(viewModel.gender == choice ? .blue : .gray,lineWidth: 1)
                                    .frame(width: 25, height: 25)
                                    .overlay {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(viewModel.gender == choice ? .blue : .white)
                                    }
                                
                            }
                        }
                       
                        
                    }
                }
                .padding(20)
                .background()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                            NavigationLink {
                                AddEmailView(viewModel: viewModel)
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
    AddgenderView(viewModel: RegistrationViewModel())
}
