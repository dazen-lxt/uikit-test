//
//  ListInteractor.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import Foundation


final class ListInteractor {
    
    private var models: [ItemRepositoryResponse] = []
    let localRepository: ItemRepository
    let remoteRepository: ItemRepository
    var presenter: ListPresentationLogic?
    var page: Int = 1
    
    init(localRepository: ItemRepository, remoteRepository: ItemRepository) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    private func fetchRemoteData() {
        remoteRepository.fetchItems(page: page) { [unowned self] repositoryResponse in
            switch(repositoryResponse) {
            case .success(let data):
                self.models = data
                self.presenter?.presentItems(model: models)
                try? self.localRepository.saveItems(page: self.page, data)
                self.page += 1
            default:
                self.fetchLocalData()
            }
        }
    }
    
    private func fetchLocalData() {
        localRepository.fetchItems(page: page) { [unowned self] repositoryResponse in
            switch(repositoryResponse) {
            case .success(let data):
                self.models = data
                self.presenter?.presentItems(model: models)
                self.page += 1
            default:
                break // Show error
            }
        }
    }
}

extension ListInteractor: ListBusinessLogic {
    
    func fetchDetail(id: Int) {
    }
    
    
    func fetchData() {
        fetchRemoteData()
    }
}
