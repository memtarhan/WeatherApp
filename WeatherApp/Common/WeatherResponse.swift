//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation

// MARK: - WeatherResponse

struct WeatherResponse: Codable {
    let name: String?
    let main: Main?
    let weather: [Weather]?
    let coordinates: Coordinates?

    enum CodingKeys: String, CodingKey {
        case name, main, weather
        case coordinates = "coord"
    }
}

// MARK: - Main

struct Main: Codable {
    let temperature: Double?
    let feelsLike: Double?
    let temperatureMin, temperatureMax: Double?

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Coord

struct Coordinates: Codable {
    let longitude, latitude: Double?

    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
