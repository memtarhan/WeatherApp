//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol WeatherInteractor: AnyObject {
    var presenter: WeatherPresenter? { get set }
}

class WeatherInteractorImpl: WeatherInteractor {
    var presenter: WeatherPresenter?
}
