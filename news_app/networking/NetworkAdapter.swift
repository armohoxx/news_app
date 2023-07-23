//
//  Networking.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import Moya
import Alamofire

struct NetworkAdapter {
        
    static func getProvider() -> MoyaProvider<NewsAPI> {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "newsapi.org": .disableEvaluation
        ]
        
        let manager = Manager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return MoyaProvider<NewsAPI>(manager: manager)
    }
    
    static var requests: [Cancellable] = []
    
    static func request(target: NewsAPI,
                        success successCallback: @escaping (Response) -> Void,
                        error errorCallback: @escaping (Swift.Error) -> Void){
        let request = getProvider().request(target){ (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    do {
                        let json = try response.mapJSON() as! NSDictionary
                        if let responseStatus = ResponseStatus.from(json),
                           let errorMessage = responseStatus.message{
                            
                            let lowercaseMessage = errorMessage.lowercased()
                            guard lowercaseMessage != "unauthorized via kong-parse-auth",
                                  lowercaseMessage != "x-parse-session-token not found",
                                  lowercaseMessage != "api_key_invalid",
                                  lowercaseMessage != "token_expired_logout",
                                  lowercaseMessage != "token_expired" else {
                                return
                            }
                            let error = NSError(domain: "com.imalice.ios.error", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            errorCallback(error)
                        }else{
                            let error = NSError(domain: "com.imalice.ios.error", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "unknown_error"])
                            errorCallback(error)
                        }
                    } catch let error {
                        errorCallback(error)
                    }
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
        requests.append(request)
    }
    
}
