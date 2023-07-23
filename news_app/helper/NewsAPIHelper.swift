//
//  NewsAPIHelper.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import Foundation
import Moya

var instanceNewsAPIHelper: NewsAPIHelper? = nil

class NewsAPIHelper {
    
    static func sharedInstance() -> NewsAPIHelper {
        
        if instanceNewsAPIHelper == nil {
            instanceNewsAPIHelper = NewsAPIHelper()
        }
        
        return instanceNewsAPIHelper!
    }
    
    func fetchNewsAPI(completion: @escaping (_ statusFetchNewsAPI: String) -> Void) {
        
        NetworkAdapter.request(target: .FetchNews, success: { (response) in
            do {
                let json = try response.mapJSON() as! NSDictionary
                let jsonResultString = json.dictionaryToString ?? ""
                
                //print("jsonResultString news data = ", jsonResultString)
                
                if let codeData = ResponseCode.from(json), codeData.code == 5 {
                   UserSession.shared.setNewsDataString(string: jsonResultString)
                   completion("\(codeData.message ?? "")")
                } else {
                    UserSession.shared.setNewsDataString(string: jsonResultString)
                    completion("ok")
                }
            } catch let error {
                let errorStatusCode = (error as? MoyaError)?.response?.statusCode
                if errorStatusCode == 401 {
                    completion("401")
                } else {
                    let code = error.errorCode
                    let message = error.localizedDescription
                    let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                    if code == 6 || message.contains("\(localizedCancelled)") {
                        completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                    }else {
                        completion("\(ErrorAPI.ErrorExecute.rawValue)")
                    }
                }
            }
        }) { (error) in
            let errorStatusCode = (error as? MoyaError)?.response?.statusCode
            if errorStatusCode == 401 {
                completion("401")
            } else {
                let code = error.errorCode
                let message = error.localizedDescription
                let localizedCancelled = NSLocalizedString("\(ErrorAPI.ErrorCancelled.rawValue)", comment: "")
                if code == 6 || message.contains("\(localizedCancelled)") {
                    completion("\(ErrorAPI.ErrorCancelled.rawValue)")
                }else {
                    completion("\(ErrorAPI.ErrorExecute.rawValue)")
                }
            }
        }
    }
    
}
