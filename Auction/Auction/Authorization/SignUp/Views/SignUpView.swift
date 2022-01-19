//
//  SignUpView.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoginFlowActive: Bool = false
    @State private var isLoading: Bool = false
    
    @State private var alertContent: AlertContent?
    
    @State private var isLoggedIn: Bool = false
    
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
                LoaderButton(title: "Sign up",
                             isEnabled: true,
                             isLoading: $isLoading) {
                    isLoading = true
                    AuthService.shared.signUp(username: username,
                                              password: password) { result in
                        isLoading = false
                        switch result {
                        case .success:
                            UserDefaults.standard.set(username, forKey: "username")
                            appViewModel.currentUser.username = username
                            isLoggedIn = true
                        case .failure(let error):
                            alertContent = AlertContent(content: error.localizedDescription, completion: nil)
                        }
                    }
                }

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
                    .environmentObject(appViewModel)
            },
                           label: { EmptyView() })
        }
        .alert(
            item: $alertContent,
            content: { alertContent in
                Alert(
                    title: Text(""),
                    message: Text(alertContent.content),
                    dismissButton: .default(
                        Text("OK"),
                        action: {
                            alertContent.completion?()
                        }))
                
            }
        )
        .fullScreenCover(isPresented: $isLoggedIn) {
            ItemsView()
                .environmentObject(appViewModel)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
