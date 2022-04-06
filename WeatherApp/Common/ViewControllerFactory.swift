//
//  ViewControllerFactory.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation
import Swinject

protocol ViewControllerFactory {
    var browser: BrowserViewController { get }
    var weather: WeatherViewController { get }
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var browser: BrowserViewController { assembler.resolver.resolve(BrowserViewController.self)! }
    var weather: WeatherViewController { assembler.resolver.resolve(WeatherViewController.self)! }
}
