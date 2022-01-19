//
//  ItemsDetailView.swift
//  Auction
//
//  Created by Adam Bokun on 17.01.22.
//

import SwiftUI

struct ItemsDetailView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    @StateObject var viewModel: ItemDetailsViewModel
    let lotId: String
    init(lotId: String) {
        self.lotId = lotId
        self._viewModel = StateObject(wrappedValue: ItemDetailsViewModel())
    }
    
    @State var bet: Int = 100
    
    var body: some View {
        VStack {
            HStack{
                KingfisherImage(urlString: viewModel.itemModel.imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .topLeading)
            }
            
            Text(viewModel.itemModel.title)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(5)
            
            Text(viewModel.itemModel.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
            
            HStack {
                Spacer()
                
                Stepper(" $\(bet)", value: $bet, in: 0...100000, step: 10)
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    viewModel.makeBid(price: bet)
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
        .onAppear {
            viewModel.fetchItemDetail(id: lotId)
        }
    }
}

struct ItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsDetailView(lotId: "")
    }
}
