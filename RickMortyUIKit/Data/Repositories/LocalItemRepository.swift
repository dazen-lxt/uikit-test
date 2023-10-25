//
//  LocalItemRepository.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 24/10/23.
//

import Foundation
import CoreData
import UIKit

class LocalItemRepository: ItemRepository {
    
    let coreDataViewContext: NSManagedObjectContext
    
    init(coreDataViewContext: NSManagedObjectContext) {
        self.coreDataViewContext = coreDataViewContext
    }
    
    func fetchItems(page: Int, completion: @escaping CompletionHandler) {
        let fetchRequest: NSFetchRequest<ItemCoreDataEntity> =  ItemCoreDataEntity.fetchRequest()
        let predicate = NSPredicate(format: "page == %d", page)
        fetchRequest.predicate = predicate
        do {
            let results = try coreDataViewContext.fetch(fetchRequest)
            let repositoryResponse = results.map { ItemRepositoryResponse(id: Int($0.id), name: $0.name ?? "", image: $0.image ?? "") }.sorted(by: { $0.id < $1.id })
            completion(.success(repositoryResponse))
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveItems(page: Int, _ items: [ItemRepositoryResponse]) throws {
        for item in items {
            let itemEntity = ItemCoreDataEntity(context: coreDataViewContext)
            itemEntity.id = Int32(item.id)
            itemEntity.name = item.name
            itemEntity.image = item.image
            itemEntity.page = Int32(page)
        }
        do {
            try coreDataViewContext.save()
        } catch {
            throw error
        }
    }

}
