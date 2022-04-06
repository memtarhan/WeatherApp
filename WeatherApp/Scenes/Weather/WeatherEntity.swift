//
//  WeatherEntity.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

struct WeatherEntity {
    struct Current {
        struct ViewModel {
            let location: String
            let condition: String
            let temperature: String
            let feelsLike: String
            let minTemperature: String
            let maxTemperature: String
        }
    }

    struct Daily {
        struct ViewModel {
            let day: String
            let condition: String
            let temperature: String
        }
    }
}
