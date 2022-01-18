//
//  SignUpView.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isLoginFlowActive: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Spacer()
                Text("Sign up")
                    .font(.title)
                    .padding()
                    .foregroundColor(.brown)
                Spacer()
            }
            .padding(.top, 55)
            .padding(.bottom, 30)
            
            VStack(alignment: .center, spacing: 16) {
                TextField("Username", text: $username)
                    .frame(height: 48)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Email", text: $email)
                    .frame(height: 48)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .frame(height: 48)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 25)
            
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Sign up")
                })
                    .frame(width: 90, height: 45)
                    .padding(.top, 24)
                    .foregroundColor(.brown)
                    .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.top, 25)
            
            Text("Login")
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.thin)
                .underline()
                .onTapGesture {
                    self.isLoginFlowActive = true
                }
            
            NavigationLink(isActive: $isLoginFlowActive,
                           destination: {
                LoginView()
            },
                           label: { EmptyView() })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
