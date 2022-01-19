//
//  ContentView.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 16.01.22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isHomeViewActive: Bool = false
    
    @State var isLoading: Bool = false
    @State var isLoggedIn: Bool = false
    
    @State var alertContent: AlertContent?
    
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
                
                SecureField("Password", text: $password)
                    .frame(height: 48)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 25)
            
            HStack {
                Spacer()
                
                LoaderButton(title: "Log in",
                             isEnabled: true,
                             isLoading: $isLoading) {
                    isLoading = true
                    AuthService.shared.login(username: username,
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
            .padding(.bottom, 30)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
