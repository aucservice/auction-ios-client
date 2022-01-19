//
//  ItemsView.swift
//  Auction
//
//  Created by Adam Bokun on 17.01.22.
//

import SwiftUI
import Combine

struct ItemsView: View {
    @StateObject var viewModel: ItemsViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: ItemsViewModel())
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.lotsList) { item in
                NavigationLink(destination: {
                    ItemsDetailView()
                }, label: {
                    HStack {
                        // TODO: - refactor to using Kingfisher
                        Image("")
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
                            Text("$100")
                                .foregroundColor(.green)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                })
            }
            .navigationTitle("NFT for sale")
        }
        .onAppear {
            viewModel.fetchAllLots()
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
