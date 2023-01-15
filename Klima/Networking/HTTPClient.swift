//
//  HTTPClient.swift
//  Klima
//
//  Created by Office on 1/15/23.
//

import Foundation

protocol HTTPClientImpl {
    
    func request<T: Codable>(url: URL?,
                             type: T.Type) async throws -> T
}


class HTTPClient : HTTPClientImpl {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        
        guard let url = url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await urlSession.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkError.invalidStatusCode(statusCode: statusCode)
        }
        
        guard let data = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return data
        
    }
}
