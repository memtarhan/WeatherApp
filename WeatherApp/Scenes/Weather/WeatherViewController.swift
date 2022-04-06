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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    private func setup() {
    }

    private func localize() {
    }
}

// MARK: - WeatherViewController

extension WeatherViewControllerImpl: WeatherViewController {
}
