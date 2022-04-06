//
//  BrowserViewController.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol BrowserViewController: AnyObject {
    var presenter: BrowserPresenter? { get set }
}

class BrowserViewControllerImpl: UIViewController {
    var presenter: BrowserPresenter?

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

// MARK: - BrowserViewController

extension BrowserViewControllerImpl: BrowserViewController {
}
