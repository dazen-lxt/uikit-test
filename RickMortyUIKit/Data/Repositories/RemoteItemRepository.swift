//
//  RemoteItemRepository.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 24/10/23.
//

import Foundation


class RemoteItemRepository: ItemRepository {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchItems(page: Int, completion: @escaping CompletionHandler) {
        Task {
            do {
                let params: [URLQueryItem] = [URLQueryItem(name: "page", value: "\(page)")]
                let apiResponse: Result<ListApiResponse, ApiClientError> = try await apiClient.sendRequest(method: .get, path: "items", queryItems: params, body: nil)
                switch apiResponse {
                case .success(let data):
                    let repositoryResponse = data.results.map { ItemRepositoryResponse(id: $0.id, name: $0.name, image: $0.image) }
                    completion(.success(repositoryResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveItems(page: Int, _ items: [ItemRepositoryResponse]) throws {
        
    }

}
