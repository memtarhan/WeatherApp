//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}
