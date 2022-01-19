//
//  ItemsViewModel.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 19.01.22.
//

import Foundation
import Combine

class ItemsViewModel: ObservableObject {
    
    @Published var lotsList = [LotModel]()
    
    func fetchAllLots() {
        LotService.shared.getAllLots { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                var lotsModel = [LotModel]()
                for (_,lot) in model {
                    lotsModel.append(lot)
                }
                self.lotsList.append(contentsOf: lotsModel)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
