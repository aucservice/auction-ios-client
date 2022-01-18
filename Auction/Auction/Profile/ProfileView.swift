//
//  ProfileView.swift
//  Auction
//
//  Created by Adam Bokun on 18.01.22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var bet: Int = 0
    
    var body: some View {
        
        VStack {
            Text("Your Name")
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
            
            List(0..<20) { item in
                HStack {
                    Image("test_image")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Name of picture")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        Text("$100")
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
