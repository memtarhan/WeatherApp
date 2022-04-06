//
//  DailyResponse.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation

// MARK: - DailyResponse

struct DailyResponse: Codable {
    let daily: [Daily]?
}

// MARK: - Daily

struct Daily: Codable {
    let date, sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let clouds: Int?
    let pop, uvi, rain: Double?

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike

struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp

struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}
