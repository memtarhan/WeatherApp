//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol WeatherRouter: AnyObject {
    var view: WeatherViewController? { get set }
}

class WeatherRouterImpl: WeatherRouter {
    var view: WeatherViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
