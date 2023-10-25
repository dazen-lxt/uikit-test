//
//  ListPresenter.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import Foundation

final class ListPresenter {
    
    weak var viewController: ListDisplayLogic?
}

extension ListPresenter: ListPresentationLogic {
    
    func presentDetailFetched() {
    }
    
    func presentItems(model: [ItemRepositoryResponse]) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.displayItems(viewModel: model.map {
                ItemViewModel(title: $0.name, imageUrl: $0.image)
            })
        }
    }
}
