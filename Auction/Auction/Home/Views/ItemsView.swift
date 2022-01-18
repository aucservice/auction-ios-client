//
//  ItemsView.swift
//  Auction
//
//  Created by Adam Bokun on 17.01.22.
//

import SwiftUI

struct ItemsView: View {
    
    @State var isDetailPresented: Bool = false
    
    var body: some View {
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
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text("Description")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .onTapGesture {
                    self.isDetailPresented = true
                }
            }
            .navigationTitle("NFT for sale")
            
            NavigationLink(isActive: $isDetailPresented,
                           destination: {
                ItemsDetailView()
            },
                           label: { EmptyView() })

        }
    
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
