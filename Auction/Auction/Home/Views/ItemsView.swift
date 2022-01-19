//
//  ItemsView.swift
//  Auction
//
//  Created by Adam Bokun on 17.01.22.
//

import SwiftUI
import Combine

struct ItemsView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var viewModel: ItemsViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: ItemsViewModel())
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.lotsList) { item in
                NavigationLink(destination: {
                    ItemsDetailView(lotId: item.id)
                }, label: {
                    HStack {
                        KingfisherImage(urlString: item.imageURL)
                            .resizable()
                            .scaledToFit()
                            .frame( width: 100, height: 70)
                            .cornerRadius(4)
                            .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            Text("$100")
                                .foregroundColor(.green)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                })
            }
            .navigationTitle("NFT for sale")
        }
        .onAppear {
            viewModel.fetchAllLots()
        }
        .onChange(of: viewModel.lotsList) { newValue in
            self.appViewModel.allLots = newValue
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
