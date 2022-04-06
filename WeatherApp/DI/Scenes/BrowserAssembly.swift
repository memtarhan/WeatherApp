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
            let viewController = BrowserViewControllerImpl()
            let presenter = r.resolve(BrowserPresenter.self)!

            presenter.view = viewController
            viewController.presenter = presenter

            return viewController
        }

        container.register(BrowserPresenter.self) { _ in
            BrowserPresenterImpl()
        }
    }
}
