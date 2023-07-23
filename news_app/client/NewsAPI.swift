//
//  NewsAPI.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 22/7/2566 BE.
//

import Foundation
import Moya
import SwiftyJSON

enum NewsAPI {
    case FetchNews
}

extension NewsAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: url)!
    }
    
    var url: String {
        switch self {
            
        case .FetchNews:
            return Constants.DefaultAPIURL
        }
    }
    
    var path: String{
        switch self {
            
        case .FetchNews:
            return "/v2/everything"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .FetchNews:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .FetchNews:
            var parameters = [String: Any]()
            parameters["q"] = "tesla"
            parameters["from"] = "2023-07-22"
            parameters["sortBy"] = "publishedAt"
            parameters["apiKey"] = Constants.DefaultAPIKey
            parameters["language"] = "en"
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .FetchNews:
            return [
                "Content-Type": "application/json",
            ]
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    
}
