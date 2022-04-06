//
//  WeatherAssembly.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class WeatherAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherViewController.self) { r in
            let viewController = WeatherViewControllerImpl(nibName: "WeatherViewController", bundle: nil)
            let presenter = r.resolve(WeatherPresenter.self)!
            let interactor = r.resolve(WeatherInteractor.self)!

            presenter.view = viewController
            presenter.interactor = interactor
            viewController.presenter = presenter

            return viewController
        }

        container.register(WeatherPresenter.self) { _ in
            WeatherPresenterImpl()
        }

        container.register(WeatherInteractor.self) { _ in
            WeatherInteractorImpl()
        }
    }
}
