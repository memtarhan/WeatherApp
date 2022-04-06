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

    func present(for city: String)
}

class WeatherPresenterImpl: WeatherPresenter {
    var view: WeatherViewController?
    var interactor: WeatherInteractor?

    func present(for city: String) {
        interactor?.fetchCurrent(for: city, { result in
            switch result {
            case let .success(weather):
                self.updateCurrent(weather)
                self.interactor?.fetchDaily(for: weather.coordinates, { dailyResult in
                    switch dailyResult {
                    case let .success(daily):
                        self.updateDaily(daily)
                    case let .failure(error):
                        print(error)
                    }
                })
            case let .failure(error):
                print(error)
            }
        })
    }

    private func updateCurrent(_ weather: WeatherResponse) {
        let location = weather.name ?? "Cannot find city"

        var temperatureString = "No temperature"
        if let temperature = weather.main?.temperature {
            temperatureString = "\(temperature)°"
        }

        var conditionString = "No condition"
        if let condition = weather.weather?.first?.main {
            conditionString = condition
        }

        var feelsLikeString = "No feels like"
        if let feelsLike = weather.main?.feelsLike {
            feelsLikeString = "Feels like \(feelsLike)°"
        }

        var highTempString = "No high temp"
        if let high = weather.main?.temperatureMax {
            highTempString = "H:\(high)°"
        }

        var lowTempString = "No high temp"
        if let low = weather.main?.temperatureMin {
            lowTempString = "L:\(low)°"
        }

        let viewModel = WeatherEntity.Current.ViewModel(location: location,
                                                        condition: conditionString,
                                                        temperature: temperatureString,
                                                        feelsLike: feelsLikeString,
                                                        minTemperature: lowTempString,
                                                        maxTemperature: highTempString)

        view?.display(viewModel)
    }

    private func updateDaily(_ daily: DailyResponse) {
        guard let data = daily.daily?[1 ... 5] else { return }
        let dailyData = Array(data)
        let viewModels = dailyData.map { dailyData -> WeatherEntity.Daily.ViewModel in
            let date = Date(timeIntervalSince1970: TimeInterval(dailyData.date ?? 0))

            var conditionString = "No condition"
            if let condition = dailyData.weather?.first?.main {
                conditionString = condition
            }
            var temperatureString = "No temperature"
            if let temperature = dailyData.temp?.day {
                temperatureString = "\(temperature)°"
            }
            let viewModel = WeatherEntity.Daily.ViewModel(day: date.asDay,
                                                          condition: conditionString,
                                                          temperature: temperatureString)
            return viewModel
        } 

        view?.display(viewModels)
    }
}
