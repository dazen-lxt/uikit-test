//
//  ListContract.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import Foundation

protocol ListPresentationLogic: AnyObject {
    func presentItems(model: [ItemRepositoryResponse])
}

protocol ListDisplayLogic: AnyObject {
    func displayItems(viewModel: [ItemViewModel])
}

protocol ListBusinessLogic: AnyObject {
    func fetchData()
}

protocol ListWireframeLogic: AnyObject {
    func goToDetail()
}
