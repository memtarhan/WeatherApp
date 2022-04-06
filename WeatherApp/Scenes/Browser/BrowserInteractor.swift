//
//  BrowserInteractor.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol BrowserInteractor: AnyObject {
    var presenter: BrowserPresenter? { get set }
}

class BrowserInteractorImpl: BrowserInteractor {
    var presenter: BrowserPresenter?
}
