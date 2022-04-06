//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol WeatherPresenter: AnyObject {
    var view: WeatherViewController? { get set }
    var interactor: WeatherInteractor? { get set }
    var router: WeatherRouter? { get set }
}

class WeatherPresenterImpl: WeatherPresenter {
    var view: WeatherViewController?
    var interactor: WeatherInteractor?
    var router: WeatherRouter?
}
