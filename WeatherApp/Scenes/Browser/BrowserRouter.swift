//
//  BrowserRouter.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol BrowserRouter: AnyObject {
    var view: BrowserViewController? { get set }
}

class BrowserRouterImpl: BrowserRouter {
    var view: BrowserViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
