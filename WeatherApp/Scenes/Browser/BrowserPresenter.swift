//
//  BrowserPresenter.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol BrowserPresenter: AnyObject {
    var view: BrowserViewController? { get set }
    var interactor: BrowserInteractor? { get set }
    var router: BrowserRouter? { get set }
}

class BrowserPresenterImpl: BrowserPresenter {
    var view: BrowserViewController?
    var interactor: BrowserInteractor?
    var router: BrowserRouter?
}
