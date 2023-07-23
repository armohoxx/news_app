//
//  MainRouter.swift
//  news_app
//
//  Created Phattarapon Jungtakarn on 22/7/2566 BE.
//  Copyright © 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainViewController(nibName: nil, bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return UINavigationController(rootViewController: view)
    }
}

extension MainRouter: MainWireframeProtocol {
    
    func routeToDetailView(news: ArticlesEntity) {
        let newsDetailPage = NewsDetailRouter.createModuleNewsData(news: news)
        self.viewController?.navigationController?.pushViewController(newsDetailPage, animated: true)
    }
    
}
