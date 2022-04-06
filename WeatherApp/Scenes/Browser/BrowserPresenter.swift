//
//  BrowserPresenter.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol BrowserPresenter: AnyObject {
    var view: BrowserViewController? { get set }
    
    func present()
}

class BrowserPresenterImpl: BrowserPresenter {
    var view: BrowserViewController?
    
    private let url = "https://www.c-and-a.com/eu/en/"
    
    func present() {
        guard let url = URL(string: url) else { return }
        view?.displayWebPage(with: url)
    }
}
