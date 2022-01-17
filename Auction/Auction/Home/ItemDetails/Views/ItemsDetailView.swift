//
//  ItemsDetailView.swift
//  Auction
//
//  Created by Adam Bokun on 17.01.22.
//

import SwiftUI

struct ItemsDetailView: View {
    
    @State var bet: Int = 0
    
    var body: some View {
        VStack {
            HStack{
                Image("test_image")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .topLeading)
            }
            
            Text("Game Title")
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(5)
            
            Text("by J. Williams")
                .font(.headline)
                .fontWeight(.regular)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)
            
            Text("$100")
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
            
            Text("last bet by Ryan Gosling")
//                .font(.headline)
                .font(.italic(.headline)())
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                
            
            Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle.")
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
            
            HStack {
                Stepper(" $\(bet)", value: $bet, in: 0...100000, step: 10)
            }.padding(.horizontal, 130)
            
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Place a Bet")
                        .font(.title2)
                        
                })
                    .frame(height: 40)
                    .padding(.top, 40)
                    .foregroundColor(.blue)
                    .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct ItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsDetailView()
    }
}
