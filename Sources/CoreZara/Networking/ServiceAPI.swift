//
//  ServiceAPI.swift
//  rickmorty-cibernos
//
//  Created by Jorge Luis Requez Rodriguez on 20/01/23.
//

import Foundation

public enum ServiceAPI {
    
    case home(Home)
    
}

public extension ServiceAPI {
        
    var path: String {
        switch self {
        case .home(.characters):
            return "character"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .home(.characters):
            return "GET"
        }
    }
    
}
