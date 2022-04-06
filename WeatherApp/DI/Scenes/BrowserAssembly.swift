//
//  BrowserAssembly.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class BrowserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BrowserViewController.self) { r in
            let viewController = BrowserViewControllerImpl(nibName: "BrowserViewController", bundle: nil)
            let presenter = r.resolve(BrowserPresenter.self)!
            let interactor = r.resolve(BrowserInteractor.self)!
            let router = r.resolve(BrowserRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(BrowserPresenter.self) { _ in
            BrowserPresenterImpl()
        }

        container.register(BrowserInteractor.self) { _ in
            BrowserInteractorImpl()
        }

        container.register(BrowserRouter.self) { r in
            BrowserRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
