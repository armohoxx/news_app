//
//  MainProtocols.swift
//  news_app
//
//  Created Phattarapon Jungtakarn on 22/7/2566 BE.
//  Copyright © 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol MainWireframeProtocol: class {
    func routeToDetailView(news: ArticlesEntity)
}
//MARK: Presenter -
protocol MainPresenterProtocol: class {
    func notifyFetchNewsData()
    func notifyDisplayNewsData(newsData: NewsEntity)
    func notifyRouteToDetailView(news: ArticlesEntity)
}

//MARK: Interactor -
protocol MainInteractorProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
    func fetchNewsData()
}

//MARK: View -
protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol?  { get set }
    func displayNewsData(newsData: NewsEntity)
}