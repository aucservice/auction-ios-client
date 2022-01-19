//
//  ProfileView.swift
//  Auction
//
//  Created by Adam Bokun on 18.01.22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            Text(appViewModel.currentUser.username)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(2)
            
            Text("Your Lots")
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            List(appViewModel.currentUser.lots) { item in
                HStack {
                    KingfisherImage(urlString: item.imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
        }
        .onAppear {
            appViewModel.getCurrentUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
