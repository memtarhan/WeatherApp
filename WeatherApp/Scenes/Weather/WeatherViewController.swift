//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol WeatherViewController: AnyObject {
    var presenter: WeatherPresenter? { get set }
}

class WeatherViewControllerImpl: UIViewController {
    var presenter: WeatherPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        presenter?.present(for: "Dusseldorf")
    }
}

// MARK: - WeatherViewController

extension WeatherViewControllerImpl: WeatherViewController {
}
