//
//  UserSession.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import Foundation
import UIKit

class UserSession {
    
    static let shared = UserSession()
    static let newsData = "newsData"
    
    func setNewsDataString(string: String) {
        UserDefaults.standard.set(string, forKey: UserSession.newsData)
        UserDefaults.standard.synchronize()
    }
    
    func getNewsData() -> NewsEntity? {
        if let newsDataString = UserDefaults.standard.string(forKey: UserSession.newsData) {
            if let jsonResult = newsDataString.dictionary() {
                if let newsData = NewsEntity.from(jsonResult) {
                    return newsData
                }
            }
        }
        return nil
    }
    
}
