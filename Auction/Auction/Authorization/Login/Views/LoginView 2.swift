//
//  ContentView.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Spacer()
                Text("Login")
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
                
                SecureField("Password", text: $username)
                    .frame(height: 48)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 25)
            
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Login")
                })
                    .frame(height: 40)
                    .padding(.top, 24)
                    .foregroundColor(.brown)
                    .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 30)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
