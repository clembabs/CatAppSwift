//
//  api_error.swift
//  cat_app
//
//  Created by Clement Babaniyi on 30/08/2023.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Connection Failed"
        case .url(let error):
            return error?.localizedDescription ?? "An Error occured"
        }
    }
    var description: String {
            //info for debugging
            switch self {
            case .unknown: return "unknown error"
            case .badURL: return "invalid URL"
            case .url(let error):
                return error?.localizedDescription ?? "url session error"
            case .parsing(let error):
                return "parsing error \(error?.localizedDescription ?? "")"
            case .badResponse(statusCode: let statusCode):
                return "bad response with status code \(statusCode)"
            }
        }
}

