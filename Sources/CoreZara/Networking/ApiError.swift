//
//  ApiError.swift
//  
//
//  Created by Jorge Luis Requez Rodriguez on 22/01/23.
//

import Foundation

public enum ApiError: Error {

    case cancelled
    case invalidURL
    case requestFailed
    case decodingFailure
    case invalidResponse
    case apiParseError
    case responseError(data: Data?, httpUrlResponse: HTTPURLResponse)
}
