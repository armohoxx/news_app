//
//  NewsEntity.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 22/7/2566 BE.
//

import Mapper

class NewsEntity: NSObject, Mappable {
    
    var status: String?
    var totalResults: Int?
    var articles: [ArticlesEntity] = []
        
    required init(map: Mapper) throws {
        self.status = map.optionalFrom("status")
        self.totalResults = map.optionalFrom("totalResults")
        
        let articlesArray: [NSDictionary]? = map.optionalFrom("articles") ?? []
        if let articlesArray = articlesArray {
            for data in articlesArray {
                if let articles = ArticlesEntity.from(data) {
                    self.articles.append(articles)
                }
            }
        }
    }
    
}

class ArticlesEntity: NSObject, Mappable, Codable {
    
    var id: String
    var name: String
    var author: String
    var title: String
    var descriptionNews: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    required init(map: Mapper) throws {
        self.id = map.optionalFrom("source.id") ?? ""
        self.name = map.optionalFrom("source.name") ?? ""
        self.author = map.optionalFrom("author") ?? ""
        self.title = map.optionalFrom("title") ?? ""
        self.descriptionNews = map.optionalFrom("description") ?? ""
        self.url = map.optionalFrom("url") ?? ""
        self.urlToImage = map.optionalFrom("urlToImage") ?? ""
        self.publishedAt = map.optionalFrom("publishedAt") ?? ""
        self.content = map.optionalFrom("content") ?? ""
    }
    
}
