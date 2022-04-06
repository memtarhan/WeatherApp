//
//  BrowserViewController.swift
//  WeatherApp
//
//  Created Mehmet Tarhan on 06/04/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit
import WebKit

protocol BrowserViewController: AnyObject {
    var presenter: BrowserPresenter? { get set }

    func displayWebPage(with url: URL)
}

class BrowserViewControllerImpl: UIViewController {
    var presenter: BrowserPresenter?

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        presenter?.present()
    }
}

// MARK: - WKNavigationDelegate

extension BrowserViewControllerImpl: WKNavigationDelegate {
    /// - When a navigation starts
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        displayLoadingIndicator()
    }

    /// - When a navigation finishes
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        removeLoadingIndicator()
    }
}

// MARK: - BrowserViewController

extension BrowserViewControllerImpl: BrowserViewController {
    func displayWebPage(with url: URL) {
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
            self.webView.allowsBackForwardNavigationGestures = true
        }
    }
}
