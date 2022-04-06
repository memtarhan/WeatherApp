//
//  APICallable.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation

protocol APICallable: AnyObject {
    var apiKey: String { get } // API Key
    var baseURL: String { get } // Base URL
    var decoder: JSONDecoder { get }
}

extension APICallable {
    var apiKey: String { return "507cf4e20f94c76ef6efffc0851f7946" }
    var baseURL: String { return "https://api.openweathermap.org/data/2.5/" }
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}
