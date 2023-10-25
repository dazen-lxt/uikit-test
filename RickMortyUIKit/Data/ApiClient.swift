//
//  ApiClient.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import Foundation

protocol ApiClient {
    func sendRequest<T: Decodable>(method: HttpMethod, path: String, queryItems: [URLQueryItem]?, body: Data?) async throws -> Result<T, ApiClientError>
}

class ApiClientImpl: ApiClient {

    private let urlSession = URLSession.shared
    private let baseURL: URL = URL(string: "https://rickandmortyapi.com/api/")!

    func sendRequest<T: Decodable>(method: HttpMethod, path: String, queryItems: [URLQueryItem]?, body: Data?) async throws -> Result<T, ApiClientError> {
        var urlComponent = URLComponents(string: baseURL.appendingPathComponent(path).absoluteString)!
        if let queryItems = queryItems {
            urlComponent.queryItems = queryItems
        }
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = method.rawValue


        if let body = body {
            request.httpBody = body
        }

        let (data, response) = try await urlSession.data(for: request)
        let httpResponse = response as? HTTPURLResponse
        guard httpResponse?.statusCode == 200 else {
            return .failure(.invalidStatusCode(statusCode: httpResponse?.statusCode ?? 0))
        }
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
        } catch(let error) {
            print("Decoding error: \(error.localizedDescription)")
            return .failure(.decodingError(error: error))
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ApiClientError: Error {
    case invalidStatusCode(statusCode: Int)
    case decodingError(error: Error)
}
