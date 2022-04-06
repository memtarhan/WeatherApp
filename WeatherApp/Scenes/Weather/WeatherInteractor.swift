//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol WeatherInteractor: AnyObject {
    func fetchCurrent(for city: String, _ completionHandler: @escaping (Result<WeatherResponse, WeatherError>) -> Void)
    func fetchDaily(for location: Coordinates?, _ completionHandler: @escaping (Result<DailyResponse, WeatherError>) -> Void)
}

class WeatherInteractorImpl: WeatherInteractor, APICallable {
    func fetchCurrent(for city: String, _ completionHandler: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        let endpoint = "\(baseURL)weather?q=\(city)&units=metric&appid=\(apiKey)"

        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, _, error in
            guard error == nil else {
                completionHandler(.failure(.forwarded(error!)))

                return
            }

            guard let responseData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }

            do {
                let weatherResponse = try self.decoder.decode(WeatherResponse.self, from: responseData)
                completionHandler(.success(weatherResponse))

            } catch {
                completionHandler(.failure(.forwarded(error)))
            }
        }

        dataTask.resume()
    }

    func fetchDaily(for location: Coordinates?, _ completionHandler: @escaping (Result<DailyResponse, WeatherError>) -> Void) {
        guard let latitude = location?.latitude,
              let longitude = location?.longitude else {
            completionHandler(.failure(.invalidURL("Could not retrieve coordinates")))
            return
        }

        let endpoint = "\(baseURL)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=metric&appid=\(apiKey)"

        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, _, error in
            guard error == nil else {
                completionHandler(.failure(.forwarded(error!)))

                return
            }

            guard let responseData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }

            let decoder = JSONDecoder()
            do {
                let dailyResponse = try decoder.decode(DailyResponse.self, from: responseData)
                completionHandler(.success(dailyResponse))

            } catch {
                completionHandler(.failure(.forwarded(error)))
            }
        }

        dataTask.resume()
    }
}
