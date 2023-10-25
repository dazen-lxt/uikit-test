//
//  ItemRepository.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 24/10/23.
//

import Foundation

protocol ItemRepository {
    typealias CompletionHandler = (Result<[ItemRepositoryResponse], Error>) -> Void

    func fetchItems(page: Int, completion: @escaping CompletionHandler)
    func saveItems(page: Int, _ items: [ItemRepositoryResponse])  throws
}
