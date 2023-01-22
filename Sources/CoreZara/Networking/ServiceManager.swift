//
//  ServiceManager.swift
//  rickmorty-cibernos
//
//  Created by Jorge Luis Requez Rodriguez on 20/01/23.
//

import Foundation
import Combine

public protocol ServiceManagerProtocol {
    func fetch<T: Model>(_ type:T.Type, resource: ServiceAPI, completion: @escaping (Result<T, Error>) -> Void)
}

public class ServiceManager: ServiceManagerProtocol {
    
    public init() {
        
    }
    
    public func fetch<T>(_ type: T.Type, resource: ServiceAPI, completion: @escaping (Result<T, Error>) -> Void) where T : Model {
        let url = URL(string: NetworkConfiguration.baseURL + resource.path)
        // If no cached data is available then request to the server
        var urlRequest = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad)
        urlRequest.httpMethod = resource.httpMethod
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
