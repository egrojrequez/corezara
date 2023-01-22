//
//  NetworkConfiguration.swift
//  rickmorty-cibernos
//
//  Created by Jorge Luis Requez Rodriguez on 20/01/23.
//

import Foundation

public struct NetworkConfiguration {
    
    public static var baseURL: String {
        get {
            return fromInfoPList(key: .BASE_URL)
        }
    }
    
}

public extension NetworkConfiguration {
    static func fromInfoPList(key: ConfigurationKey) -> String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path),
           let value: String = info.value(forKey: key.rawValue) as? String {
            return value
        }else {
            fatalError("No resource in Info.plist")
        }
    }
}
