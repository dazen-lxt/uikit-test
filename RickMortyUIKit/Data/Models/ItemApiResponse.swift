//
//  ItemModel.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import Foundation

struct ListApiResponse: Codable {
    var info: ListApiResponseInfo
    var results: [ItemApiResponse]
}

struct ListApiResponseInfo: Codable {
    var count: Int
    var pages: Int
}

struct ItemApiResponse: Codable {
    var id: Int
    var name: String
    var image: String
}
