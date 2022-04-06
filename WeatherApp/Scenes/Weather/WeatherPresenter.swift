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

    func present(for city: String)
}

class WeatherPresenterImpl: WeatherPresenter {
    var view: WeatherViewController?
    var interactor: WeatherInteractor?
    var router: WeatherRouter?

    func present(for city: String) {
        interactor?.fetchCurrent(for: city, { result in
            switch result {
            case let .success(weather):
                print(weather)
                self.interactor?.fetchDaily(for: weather.coordinates, { dailyResult in
                    switch dailyResult {
                    case let .success(daily):
                        print(daily)
                    case let .failure(error):
                        print(error)
                    }
                })
            case let .failure(error):
                print(error)
            }
        })
    }
}
