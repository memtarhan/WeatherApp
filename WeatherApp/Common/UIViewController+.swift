//
//  UIViewController+.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayLoadingIndicator() {
        let height = view.frame.height / 12
        let margin = height / 2

        DispatchQueue.main.async { [weak self] in
            let container = UIView(frame: self?.view.bounds ?? .zero)
            container.tag = -11
            container.backgroundColor = UIColor(named: "BackgroundColorWithOpacity")
            let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: (self?.view.frame.width ?? 0 / 2) - margin,
                                                                y: (self?.view.frame.height ?? 0 / 2) - margin,
                                                                width: height,
                                                                height: height))
            activityIndicatorView.style = .large
            activityIndicatorView.center = self?.view.convert(self?.view.center ?? CGPoint(x: 0, y: 0), from: self?.view.superview) ?? CGPoint(x: 0, y: 0)
            activityIndicatorView.startAnimating()
            container.addSubview(activityIndicatorView)
            UIView.animate(withDuration: 0.3) {
                self?.view.addSubview(container)
            }
        }
    }

    func removeLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.3) {
                self?.view.viewWithTag(-11)?.removeFromSuperview()
            }
        }
    }
}
