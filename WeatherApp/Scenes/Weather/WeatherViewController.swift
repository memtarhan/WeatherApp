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

    func display(_ current: WeatherEntity.Current.ViewModel)
    func display(_ daily: [WeatherEntity.Daily.ViewModel])
}

class WeatherViewControllerImpl: UIViewController {
    var presenter: WeatherPresenter?

    // MARK: - Outlets

    @IBOutlet var currentWeatherContainerView: CardView!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!

    @IBOutlet var dailyWeatherContainerView: UIView!
    @IBOutlet var dailyWeatherTableView: UITableView!
    @IBOutlet var dailyWeatherTableViewHeightConstraint: NSLayoutConstraint!

    private let cellRowHeight: CGFloat = 64

    private var daily = [WeatherEntity.Daily.ViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        currentWeatherContainerView.alpha = 0
        dailyWeatherContainerView.alpha = 0
        dailyWeatherTableView.layer.cornerRadius = 20

        let dailyCell = UINib(nibName: DailyTableViewCell.nibIdentifier, bundle: nil)
        dailyWeatherTableView.register(dailyCell, forCellReuseIdentifier: DailyTableViewCell.cellReuseIdentifier)

        dailyWeatherTableView.dataSource = self

        presenter?.present(for: "Dusseldorf")
    }
}

extension WeatherViewControllerImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daily.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.cellReuseIdentifier) as! DailyTableViewCell
        
        let dayData = daily[indexPath.row]
        cell.dayLabel.text = dayData.day
        cell.conditionLabel.text = dayData.condition
        cell.temperatureLabel.text = dayData.temperature
        
        return cell
    }
}

// MARK: - WeatherViewController

extension WeatherViewControllerImpl: WeatherViewController {
    func display(_ current: WeatherEntity.Current.ViewModel) {
        DispatchQueue.main.async {
            self.locationLabel.text = current.location
            self.temperatureLabel.text = current.temperature
            self.conditionLabel.text = current.condition
            self.highTempLabel.text = current.maxTemperature
            self.lowTempLabel.text = current.minTemperature

            UIView.animate(withDuration: 1.0) {
                self.currentWeatherContainerView.alpha = 1.0
            }
        }
    }

    func display(_ daily: [WeatherEntity.Daily.ViewModel]) {
        self.daily = daily
        DispatchQueue.main.async {
            self.dailyWeatherTableView.reloadData()
            self.dailyWeatherTableViewHeightConstraint.constant = self.cellRowHeight * CGFloat(daily.count)

            UIView.animate(withDuration: 1.0) {
                self.dailyWeatherContainerView.alpha = 1.0
            }
        }
    }
}
