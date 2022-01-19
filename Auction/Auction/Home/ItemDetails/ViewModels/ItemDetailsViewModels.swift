//
//  ItemDetailsViewModels.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import Combine

class ItemDetailsViewModel: ObservableObject {
    
    @Published var itemModel = LotModel(id: "", title: "", imageURL: "", description: "", bidEnd: 0)
    
    func fetchItemDetail(id: String) {
        LotService.shared.getLot(by: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.itemModel = response
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func makeBid(price: Int) {
        guard let username = UserDefaults.standard.string(forKey: "username") else { return }
        LotService.shared.makeBid(username: username, lotId: itemModel.id, price: price) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
